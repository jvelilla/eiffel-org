 	<div>
 		{if isset="$user"}
    		<h3><a href="/basic_auth_logoff?destination=/roc-login">Logout</a> </h3>
		{/if}
		{unless isset="$user"}
			<h3>Login or <a href="/roc-register">Register</a></h3>
		<div>
			<div>	
			    <form action method="POST">
					<div>
						<input type="text" name="username" required>
						<label>Username</label>
					</div>
										
					<div>
						<input  type="password" name="password" required>
						<label>Password</label>
					</div>
        
					<button type="button" onclick="ROC_AUTH.login();">Login</button>
				</form>
			</div>
    	</div>
		<div>
			<div>
				<p>
					<a href="/new-password">Forgot password?</a>
				</p>
			</div>
		</div>	
		{/unless}    	
	</div>