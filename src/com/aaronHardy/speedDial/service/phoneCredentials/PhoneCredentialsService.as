package com.aaronHardy.speedDial.service.phoneCredentials
{
	import com.aaronHardy.speedDial.controller.events.PhoneCredentialsEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * @inheritDoc
	 */
	public class PhoneCredentialsService extends Actor implements IPhoneCredentialsService
	{
		[Inject]
		public var model:AppModel;
		
		/**
		 * @inheritDoc
		 */
		public function saveCredentials(extension:String, pin:String):Boolean
		{
			if (EncryptedLocalStore.isSupported)
			{
				var data:ByteArray = new ByteArray();
				data.writeUTFBytes(String(extension));
				EncryptedLocalStore.setItem('extension', data);
				
				data = new ByteArray();
				data.writeUTFBytes(String(pin));
				EncryptedLocalStore.setItem('pin', data);
				return true;
			}
			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function loadCredentials():Boolean
		{
			if (EncryptedLocalStore.isSupported)
			{
				var extensionBA:ByteArray = EncryptedLocalStore.getItem('extension');
				var extension:String;
				
				if (extensionBA)
				{
					extension = extensionBA.readUTFBytes(extensionBA.bytesAvailable);
				}
				
				var pinBA:ByteArray = EncryptedLocalStore.getItem('pin');
				var pin:String;
				
				if (pinBA)
				{
					pin = pinBA.readUTFBytes(pinBA.bytesAvailable);
				}
				
				if (extension || pin)
				{
					model.setPhoneCredentials(extension, pin);
					dispatch(new PhoneCredentialsEvent(PhoneCredentialsEvent.CREDENTIALS_LOADED, 
							extension, pin));
					return true;
				}
			}
			return false;
		}
	}
}