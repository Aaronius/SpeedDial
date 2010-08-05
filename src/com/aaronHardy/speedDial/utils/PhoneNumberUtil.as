package com.aaronHardy.speedDial.utils
{
	public class PhoneNumberUtil
	{
		public static function removeNonNumerics(target:String):String
		{
			return target.replace(/\D/g,'');
		}
	}
}