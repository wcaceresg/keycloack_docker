<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
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
            <!-- Título personalizado -->
            <#if realm.displayName??>
                <h1 id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
                          Iniciar sesión

                </h1>
            <#else>
                <h1 id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
                       Iniciar Sesión
                </h1>
            </#if>
            
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
                            <div class="${properties.kcFormGroupClass!} form-group">
                                <label for="username" class="${properties.kcLabelClass!}">
                                    <#if !realm.loginWithEmailAllowed>
                                        <i class="icon-user"></i> ${msg("username")}
                                    <#elseif !realm.registrationEmailAsUsername>
                                        <i class="icon-user"></i> ${msg("usernameOrEmail")}
                                    <#else>
                                        <i class="icon-email"></i> ${msg("email")}
                                    </#if>
                                </label>
                                <#if usernameEditDisabled??>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                <#else>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                </#if>
                                <#if messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>
                        <div class="${properties.kcFormGroupClass!} form-group">
                            <label for="password" class="${properties.kcLabelClass!}">
                                <i class="icon-lock"></i> ${msg("password")}
                            </label>
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
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
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
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
                        ${msg("noAccount")} 
                        <a tabindex="6" href="${url.registrationUrl}" class="registration-link">
                            ${msg("doRegister")}
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
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h4>${msg("identity-provider-login-label")}</h4>
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListButtonGridClass!}</#if>" type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${p.iconClasses}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
