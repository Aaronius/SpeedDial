package com.aaronHardy.speedDial.service.contactsAuthentication
{
	import com.aaronHardy.speedDial.controller.events.ContactsCredentialsEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	
	import net.nobien.webapis.google.accounts.AccountsService;
	import net.nobien.webapis.google.accounts.AuthResult;
	import net.nobien.webapis.google.accounts.ClientLogin;
	import net.nobien.webapis.google.events.AccountsEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ContactsAuthenticationService extends Actor implements IContactsAuthenticationService
	{
		[Inject]
		public var model:AppModel;
		
		protected var accountsService:AccountsService; 
		protected var username:String;
		protected var password:String;
		
		public function authenticate(username:String, password:String):void
		{
			this.username = username;
			this.password = password;
			
			model.authenticating = true;
			
			accountsService = new AccountsService();
			accountsService.addEventListener(AccountsEvent.AUTH_GET_TOKEN, authGetTokenHandler);
			accountsService.addEventListener(AccountsEvent.AUTH_FAILURE, authFailureHandler);
			accountsService.clientLogin.authenticate(
					username, 
					password, 
					'cp', 
					'aaronHardy-speedDial-0.1', 
					ClientLogin.HOSTED_OR_GOOGLE);
		}
		
		protected function authGetTokenHandler(event:AccountsEvent):void
		{
			var authResult:AuthResult = AuthResult(event.data);
			model.authHeader = accountsService.authHeader;
			dispatch(new ContactsCredentialsEvent(ContactsCredentialsEvent.AUTHENTICATED, username, password));
			cleanup();
		}
		
		protected function authFailureHandler(event:AccountsEvent):void
		{
			trace('AuthenticationService > Failure');
			cleanup();
		}
		
		protected function cleanup():void
		{
			model.authenticating = false;
			username = null;
			password = null;
		}
	}
}