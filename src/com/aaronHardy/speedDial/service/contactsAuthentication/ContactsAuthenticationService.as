package com.aaronHardy.speedDial.service.contactsAuthentication
{
	import com.aaronHardy.speedDial.controller.events.ContactsCredentialsEvent;
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	
	import net.nobien.webapis.google.accounts.AccountsService;
	import net.nobien.webapis.google.accounts.AuthResult;
	import net.nobien.webapis.google.accounts.ClientLogin;
	import net.nobien.webapis.google.events.AccountsEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * @inheritDoc
	 */
	public class ContactsAuthenticationService extends Actor implements IContactsAuthenticationService
	{
		[Inject]
		public var model:AppModel;
		
		protected var accountsService:AccountsService; 
		protected var username:String;
		protected var password:String;
		
		protected const AUTHENTICATING_MESSAGE:String = 'Authenticating...';
		
		/**
		 * @inheritDoc
		 */
		public function authenticate(username:String, password:String):void
		{
			this.username = username;
			this.password = password;
			
			model.authenticating = true;
			
			accountsService = new AccountsService();
			accountsService.addEventListener(IOErrorEvent.IO_ERROR, authFailureHandler);
			accountsService.addEventListener(SecurityErrorEvent.SECURITY_ERROR, authFailureHandler);
			accountsService.addEventListener(AccountsEvent.AUTH_GET_TOKEN, authGetTokenHandler);
			accountsService.addEventListener(AccountsEvent.AUTH_FAILURE, authFailureHandler);
			accountsService.clientLogin.authenticate(
					username, 
					password, 
					'cp', 
					'aaronHardy-speedDial-0.1', 
					ClientLogin.HOSTED_OR_GOOGLE);
			
			dispatch(new StatusMessageEvent(StatusMessageEvent.ADD_STATUS, AUTHENTICATING_MESSAGE, 0));
		}
		
		protected function authGetTokenHandler(event:AccountsEvent):void
		{
			var authResult:AuthResult = AuthResult(event.data);
			model.authHeader = accountsService.authHeader;
			dispatch(new ContactsCredentialsEvent(ContactsCredentialsEvent.AUTHENTICATED, username, password));
			removeLoadingStatus();
			cleanup();
		}
		
		protected function authFailureHandler(event:Event):void
		{
			removeLoadingStatus();
			dispatch(new StatusMessageEvent(StatusMessageEvent.ADD_STATUS, 'Authentication failed.'));
			cleanup();
		}
		
		protected function removeLoadingStatus():void
		{
			// We must explicitly remove the status because we specified a 0 duration when
			// adding the status.
			dispatch(new StatusMessageEvent(StatusMessageEvent.REMOVE_STATUS, AUTHENTICATING_MESSAGE));
		}
		
		protected function cleanup():void
		{
			model.authenticating = false;
			username = null;
			password = null;
		}
	}
}