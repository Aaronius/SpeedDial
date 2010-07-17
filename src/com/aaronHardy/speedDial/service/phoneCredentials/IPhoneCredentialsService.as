package com.aaronHardy.speedDial.service.phoneCredentials
{
	public interface IPhoneCredentialsService
	{
		function saveCredentials(extension:String, pin:String):Boolean;
		function loadCredentials():Boolean;
	}
}