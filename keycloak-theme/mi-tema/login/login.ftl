<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled?? title="Iniciar sesión"; section>
    <#if section = "header">
        <!-- Navbar blanco con logos -->
        <div class="pe-bg-header">
            <div class="pe-bg-header-content-pe">
                <img src="${url.resourcesPath}/img/logo-accede-minedu.png" alt="ACCEDE SSO - MINEDU" />
            </div>
            <div class="pe-bg-header-content-minedu">
                <img src="${url.resourcesPath}/img/logo-educacion-cab.png" alt="PERÚ Ministerio de Educación" />
            </div>
        </div>
        
        <div class="login-header">
            <!-- Subtítulo personalizado (opcional) -->
            <#if properties.subtitle??>
                <p class="login-subtitle">${properties.subtitle}</p>
            </#if>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <#if !usernameHidden??>
                            <div class="${properties.kcFormGroupClass!} form-group" id="form-input-login">
                                <#if usernameEditDisabled??>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!} pf-c-form-control" name="username" value="${(login.username!'')}" placeholder="Correo electrónico(*)" type="text" disabled autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                <#else>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!} pf-c-form-control" name="username" value="${(login.username!'')}" placeholder="Correo electrónico(*)"  type="text" autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                </#if>
                                <#if messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>
                        <div class="${properties.kcFormGroupClass!} form-group" id="form-input-login">
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" placeholder="Contraseña"  autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                            <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div id="kc-form-options">
                                <#if realm.rememberMe && !usernameHidden??>
                                    <div class="checkbox">
                                        <label>
                                            <#if login.rememberMe??>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                            <#else>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <#if realm.resetPasswordAllowed>
                                        <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                    </#if>
                                </div>
                            </div>
                        </div>
                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input tabindex="4" class="pf-c-button pf-m-primary" name="login" id="kc-login" type="submit" value="Iniciar sesión"/>
                        </div>
                    </form>
                </#if>
            </div>
        </div>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span class="registration-text">
                        ¿Usuario nuevo?
                        <a tabindex="6" href="${url.registrationUrl}" class="registration-link">
                            Regístrate
                        </a>
                    </span>
                </div>
            </div>
        </#if>
        
        <!-- Footer personalizado (opcional) -->
        <#if properties.footerText??>
            <div class="custom-footer">
                <p>${properties.footerText}</p>
            </div>
        </#if>
    <#elseif section = "socialProviders">
       
    </#if>
    
</@layout.registrationLayout>
