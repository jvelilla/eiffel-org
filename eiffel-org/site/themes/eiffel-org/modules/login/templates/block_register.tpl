 <div>
    <form action="/roc-register" method="post">
        <fieldset>
            <legend>Register Form</legend>
            <div>
                <input type="text" id="name" name="name" placeholder="User Name" required  style="input:invalid + label::after { content: ' ⨉'; }; input:valid + label::after { content: ' ✓'; }"/>
                <label for="name">Name</label>
            </div>
            <div>
                <input type="password" id="password" name="password" placeholder="Password" required/>
                <label for="password">Password</label>
            </div>
            <div>
                <input type="email" id="email" name="email" placeholder="Email" required/>
                <label for="email">Email</label>
            </div>
            {if isset="$error_name"}
                <span><i>{$error_name/}</i></span>
            {/if}
            {if isset="$error_email"}
                <span><i>{$error_email/}</i></span>
            {/if}
            <button type="submit">Register</button>
        </fieldset>    
    </form>
</div>
