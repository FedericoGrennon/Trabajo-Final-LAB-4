<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="DigitalGames.NuevoUsuario" %>

<!DOCTYPE html>
<html>
<style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 49%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div{
    border-radius: 5px;
    background-color: #f2f2f2;

}
body{
    background-color: #f2f2f2;
}

</style>
<body>

<div style="margin: 0 auto; width: 40%">
  <form action="/action_page.php" style="text-align: left">
    <div style="text-align:center">
        <label for="lname" style="font-family:Arial; font-size: 24px"><b>Nuevo Usuario</b></label>
    </div>
      <br />
      <label for="lname" style="font-family:Arial;">Datos de la cuenta</label>

      <input type="text" id="txb_usuario" name="firstname" placeholder="Usuario">

    <input type="text" id="txb_contraseña" name="lastname" placeholder="Contraseña">

    <input type="text" id="txb_confcontraseña" name="lastname" placeholder="Confirmar Contraseña">

    <input type="text" id="txb_mail" name="lastname" placeholder="Email">
  
      <br />
      <label for="lname" style="font-family:Arial;">Datos personales</label>

      <input type="text" id="txb_nombre" name="firstname" placeholder="Nombre">

    <input type="text" id="txb_apellido" name="lastname" placeholder="Apellido">

    <div style="margin:0 auto;width:100%">
        <input type="submit" value="Registrarse" style="float: left"> 
        <input type="submit" value="Iniciar Sesion" style="float:right"></div>
  </form>
</div>

</body>
</html>