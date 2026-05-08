<#--
  Theme template for Keycloak login/registration pages.
  This file defines the macro "registrationLayout" used by login.ftl and register.ftl.
-->

<#macro registrationLayout displayMessage=true displayInfo=true title="">
<#-- baseResources is the root /resources/<version> path (without /login/<themeName>) -->
<#assign baseResources = url.resourcesPath?replace('/login/mi-tema','') />
<!DOCTYPE html>
<html class="login-pf" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1"/>

    <title>${realm.displayName!""}</title>

    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />

    <link href="${baseResources}/common/keycloak/vendor/patternfly-v5/patternfly.min.css" rel="stylesheet" />
    <link href="${baseResources}/common/keycloak/vendor/patternfly-v5/patternfly-addons.css" rel="stylesheet" />
    <link href="${baseResources}/login/keycloak.v2/css/styles.css" rel="stylesheet" />


    <link href="${url.resourcesPath}/css/style.css" rel="stylesheet" />
    <link href="${url.resourcesPath}/css/login.css" rel="stylesheet" />
    


    <script type="module" async blocking="render">
        const DARK_MODE_CLASS = "pf-v5-theme-dark";
        const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
        updateDarkMode(mediaQuery.matches);
        mediaQuery.addEventListener("change", (event) => updateDarkMode(event.matches));
        function updateDarkMode(isEnabled) {
            const { classList } = document.documentElement;
            if (isEnabled) classList.add(DARK_MODE_CLASS);
            else classList.remove(DARK_MODE_CLASS);
        }
    </script>
</head>

<body class="" data-page-id="login-register">
    <#-- Header/tour/banner content is provided by nested template (login.ftl section="header") -->
    <#nested "header">

    <div class="login-pf-page">
        <div class="card-pf">
            <header class="login-pf-header">
                <h1 id="kc-page-title" class="${properties.kcHeaderWrapperClass!}" style="text-align:center;">
                    <#if title?has_content>
                        ${title}
                    <#else>
                        ${msg("doLogIn")!}
                    </#if>
                </h1>
            </header>

            <div id="kc-content">
                <div id="kc-content-wrapper">
                    <#-- Global messages (e.g., registration email success/failure) -->
                    <#if displayMessage && message?has_content>
                        <div id="kc-messages" class="login-pf-messages">
                            <div class="alert alert-${message.type!}">
                                <p class="instruction">
                                    <#if message.summary?has_content && message.summary?contains("verify your email address")>
                                        Tu cuenta necesita verificación de correo para activarse.
                                        Revisa tu bandeja de entrada y sigue las instrucciones del email.
                                    <#else>
                                        ${kcSanitize(message.summary)?no_esc}
                                    </#if>
                                </p>
                            </div>
                        </div>
                    </#if>

                    <#nested "form">

                    <#-- Registration/info block -->
                    <#if displayInfo>
                        <div id="kc-info" class="login-pf-signup">
                            <div id="kc-info-wrapper">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>

                    <#-- Social providers (optional, if your login.ftl implements section="socialProviders") -->
                    <#nested "socialProviders">
                </div>
            </div>
        </div>
    </div>
</body>
</html>
</#macro>

