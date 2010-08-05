package com.aaronHardy.speedDial
{
	import com.aaronHardy.speedDial.controller.*;
	import com.aaronHardy.speedDial.controller.events.*;
	import com.aaronHardy.speedDial.model.*;
	import com.aaronHardy.speedDial.service.clipboard.ClipboardService;
	import com.aaronHardy.speedDial.service.clipboard.IClipboardService;
	import com.aaronHardy.speedDial.service.contacts.*;
	import com.aaronHardy.speedDial.service.contactsAuthentication.*;
	import com.aaronHardy.speedDial.service.contactsCredentials.*;
	import com.aaronHardy.speedDial.service.phoneCredentials.IPhoneCredentialsService;
	import com.aaronHardy.speedDial.service.phoneCredentials.PhoneCredentialsService;
	import com.aaronHardy.speedDial.view.components.contactsAuthentication.*;
	import com.aaronHardy.speedDial.view.components.phoneAuthentication.PhoneAuthentication;
	import com.aaronHardy.speedDial.view.components.phoneAuthentication.PhoneAuthenticationMediator;
	import com.aaronHardy.speedDial.view.components.statusMessage.StatusMessage;
	import com.aaronHardy.speedDial.view.components.statusMessage.StatusMessageMediator;
	import com.aaronHardy.speedDial.view.views.contacts.*;
	import com.aaronHardy.speedDial.view.views.freeform.Freeform;
	import com.aaronHardy.speedDial.view.views.freeform.FreeformMediator;
	import com.aaronHardy.speedDial.view.views.options.Options;
	import com.aaronHardy.speedDial.view.views.options.OptionsMediator;
	
	import org.robotlegs.mvcs.Context;
	
	public class ApplicationContext extends Context
	{
		override public function startup():void
		{
			injector.mapSingleton(AppModel);
			injector.mapSingletonOf(IContactsAuthenticationService, ContactsAuthenticationService);
			injector.mapSingletonOf(IContactsService, ContactsService);
			injector.mapSingletonOf(IContactsCredentialsService, ContactsCredentialsService);
			injector.mapSingletonOf(IPhoneCredentialsService, PhoneCredentialsService);
			injector.mapSingletonOf(IClipboardService, ClipboardService);
			
			commandMap.mapEvent(StartupEvent.STARTUP, CmdStartClipboardService, StartupEvent, true);
			commandMap.mapEvent(StartupEvent.STARTUP, CmdLoadContactsCredentials, StartupEvent, true);
			commandMap.mapEvent(StartupEvent.STARTUP, CmdLoadPhoneCredentials, StartupEvent, true);
			commandMap.mapEvent(ContactsCredentialsEvent.CREDENTIALS_LOADED, CmdContactsAuthenticate, ContactsCredentialsEvent);
			commandMap.mapEvent(ContactsCredentialsEvent.AUTHENTICATION_TRIGGERED, CmdContactsAuthenticate, ContactsCredentialsEvent);
			commandMap.mapEvent(ContactsCredentialsEvent.AUTHENTICATED, CmdLoadContacts, ContactsCredentialsEvent);
			commandMap.mapEvent(ContactsCredentialsEvent.AUTHENTICATED, CmdSaveContactsCredentials, ContactsCredentialsEvent);
			commandMap.mapEvent(PhoneCredentialsEvent.CREDENTIALS_SAVE_TRIGGERED, CmdSavePhoneCredentials, PhoneCredentialsEvent);
			commandMap.mapEvent(CallEvent.CALL_TRIGGERED, CmdPlaceCall, CallEvent);
			
			mediatorMap.mapView(ContactsAuthentication, ContactsAuthenticationMediator);
			mediatorMap.mapView(PhoneAuthentication, PhoneAuthenticationMediator);
			mediatorMap.mapView(Contacts, ContactsMediator);
			mediatorMap.mapView(Options, OptionsMediator);
			mediatorMap.mapView(Freeform, FreeformMediator);
			mediatorMap.mapView(StatusMessage, StatusMessageMediator);
			
			dispatchEvent(new StartupEvent(StartupEvent.STARTUP));
		}
	}
}