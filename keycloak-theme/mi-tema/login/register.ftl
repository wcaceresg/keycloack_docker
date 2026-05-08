<#import "template.ftl" as layout>

<@layout.registrationLayout displayInfo=false displayMessage=true title="Registrarse"; section>

<#if section = "form">
<form id="kc-register-form"
      action="${url.registrationAction}"
      method="post">

    <!-- EMAIL -->
    <div class="${properties.kcFormGroupClass!}">
        <label for="email">Correo electrónico</label>
        <input type="email"
               id="email"
               name="email"
               value="${(register.formData.email!'')}"
               class="pf-c-form-control"
               required />
    </div>

    <!-- PASSWORD -->
    <div class="${properties.kcFormGroupClass!}">
        <label for="password">Contraseña</label>
        <input type="password"
               id="password"
               name="password"
               class="pf-c-form-control"
               required />
    </div>

    <!-- CONFIRM PASSWORD -->
    <div class="${properties.kcFormGroupClass!}">
        <label for="password-confirm">Confirmar contraseña</label>
        <input type="password"
               id="password-confirm"
               name="password-confirm"
               class="pf-c-form-control"
               required />
    </div>

    <div class="${properties.kcFormGroupClass!}">
        <button type="submit" class="pf-c-button pf-m-primary">Registrarse</button>
    </div>

</form>
</#if>

</@layout.registrationLayout>
