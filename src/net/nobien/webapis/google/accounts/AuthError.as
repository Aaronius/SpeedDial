/*
Source Code License Agreement
Copyright (c) 2007, Matthew D. Wright. All rights reserved.

Matthew D. Wright grants to you a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright license, to reproduce,
prepare derivative works of, publicly display, publicly perform, and
distribute this source code and such derivative works in source or
object code form without any attribution requirements.

The name "Matthew D. Wright" must not be used to endorse or promote 
products derived from the source code without prior written permission.

You agree to indemnify, hold harmless and defend Matthew D. Wright from 
and against any loss, damage, claims or lawsuits, including attorney's fees 
that arise or result from your use or distribution of the source code.

THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT
ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package net.nobien.webapis.google.accounts
{
	/**
	 * The AuthError class abstracts an error response during the
	 * authentication process. This class also contains static
	 * references to specific Google error codes.
	 */
	public class AuthError 
	{
		/**
		 * The login request used a username or password that is not recognized.
		 */
		public static const BAD_AUTHENTICATION:String = "BadAuthentication";
		
		/**
		 * The account email address has not been verified. The user will need 
		 * to access their Google account directly to resolve the issue before 
		 * logging in using a non-Google application.
		 */
		public static const NOT_VERIFIED:String = "NotVerified";
		
		/**
		 * The user has not agreed to terms. The user will need to access their 
		 * Google account directly to resolve the issue before logging in using 
		 * a non-Google application.
		 */
		public static const TERMS_NOT_AGREED:String = "TermsNotAgreed";
		
		/**
		 * A CAPTCHA is required. (A response with this error code will also 
		 * contain an image URL and a CAPTCHA token.)
		 */
		public static const CAPTCHA_REQUIRED:String = "CaptchaRequired";
		
		/**
		 * The error is unknown or unspecified; the request contained invalid 
		 * input or was malformed.
		 */
		public static const UNKNOWN:String = "Unknown";
		
		/**
		 * The user account has been deleted.
		 */
		public static const ACCOUNT_DELETED:String = "AccountDeleted";
		
		/**
		 * The user account has been disabled.
		 */
		public static const ACCOUNT_DISABLED:String = "AccountDisabled";
		
		/**
		 * The user's access to the specified service has been disabled. 
		 * (The user account may still be valid.)
		 */
		public static const SERVICE_DISABLED:String = "ServiceDisabled";
		
		/**
		 * The service is not available; try again later.
		 */
		public static const SERVICE_UNAVAILABLE:String = "ServiceUnavailable";
		
		private var _captchaToken:String = null;
		private var _captchaURL:String = null;
		private var _error:String;
		private var _url:String = null;
		
		/**
		 * Constructs a new AuthError object.
		 */
		public function AuthError() 
		{
			
		}
		
		/**
		 * CAPTCHA token from Google
		 */
		public function get captchaToken():String
		{
			return _captchaToken;
		}
		
		public function set captchaToken( v:String ):void
		{
			_captchaToken = v;
		}
		
		/**
		 * URL to a CAPTCHA image
		 */
		public function get captchaURL():String
		{
			return _captchaURL;
		}
		
		public function set captchaURL( v:String ):void
		{
			_captchaURL = v;
		}
		
		/**
		 * The error code from Google.
		 */
		public function get error():String
		{
			return _error;
		}
		
		public function set error( v:String ):void
		{
			_error = v;
		}
		
		/**
		 * A URL to an error page that can be displayed to the user.
		 */
		public function get url():String
		{
			return _url;
		}
		
		public function set url( v:String ):void
		{
			_url = v;
		}
		
	}
	
}
