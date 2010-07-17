package com.aaronHardy.speedDial.service.contactsCredentials
{
	import com.aaronHardy.speedDial.controller.events.ContactsCredentialsEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ContactsCredentialsService extends Actor implements IContactsCredentialsService
	{
		[Inject]
		public var model:AppModel;
		
		public function saveCredentials(username:String, password:String):Boolean
		{
			if (EncryptedLocalStore.isSupported)
			{
				var data:ByteArray = new ByteArray();
				data.writeUTFBytes(username);
				EncryptedLocalStore.setItem('username', data);
				
				data = new ByteArray();
				data.writeUTFBytes(password);
				EncryptedLocalStore.setItem('password', data);
				return true;
			}
			return false;
		}
		
		public function loadCredentials():Boolean
		{
			if (EncryptedLocalStore.isSupported)
			{
				var data:ByteArray = EncryptedLocalStore.getItem('username');
				
				if (data)
				{
					var username:String = data.readUTFBytes(data.bytesAvailable);
					
					data = EncryptedLocalStore.getItem('password');
					var password:String = data.readUTFBytes(data.bytesAvailable);
					
					model.setContactsCredentials(username, password);
					dispatch(new ContactsCredentialsEvent(ContactsCredentialsEvent.CREDENTIALS_LOADED, 
							username, password));
					return true;
				}
			}
			return false;
		}
	}
}