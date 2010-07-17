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

package net.nobien.webapis.google.utils 
{
	import net.nobien.webapis.google.accounts.AuthError;
	import net.nobien.webapis.google.accounts.AuthResult;
	
	/**
	 * The AccountsHelper class provides helper methods for processing
	 * responses from the Google Accounts API.
	 */
	public class AccountsHelper 
	{
		/**
		 * Parses an error response during the authentication process.
		 */
		public static function parseAuthError( response:String ):AuthError
		{
			var authError:AuthError = new AuthError();
			var varList:Array = response.split( "\n" );
				
			for( var i:int = 0; i < varList.length; i++ )
			{
				var pair:Array = String( varList[i] ).split( "=" );
				var name:String = pair[0];
				var value:String = pair[1];
				
				switch( name )
				{
					case "Url" :
						authError.url = value;
						break;
						
					case "Error" :
						authError.error = value;
						break;
						
					case "CaptchaToken" :
						authError.captchaToken = value;
						break;
						
					case "CaptchaUrl" :
						authError.captchaURL = value;
						break;
				}
			}
			
			return authError;
		}
		
		/**
		 * Parses a successful authentication response.
		 */
		public static function parseAuthResponse( response:String ):AuthResult
		{
			var authResult:AuthResult = new AuthResult();
			var varList:Array = response.split( "\n" );
			
			for( var i:int = 0; i < varList.length; i++ )
			{
				var pair:Array = String( varList[i] ).split( "=" );
				var name:String = pair[0];
				var value:String = pair[1];
				
				switch( name )
				{
					case "SID" :
						authResult.sid = value;
						break;
						
					case "LSID" :
						authResult.lsid = value;
						break;
						
					case "Auth" :
						authResult.auth = value;
				}
			}
			
			return authResult;
		}
		
	}
	
}
