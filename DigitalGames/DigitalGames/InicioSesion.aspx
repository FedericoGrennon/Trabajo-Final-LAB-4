<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="DigitalGames.InicioSesion" %>

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
  <form action="/action_page.php">
    <div style="text-align:center">
        <label for="lname" style="font-family:Arial; font-size: 24px"><b>Inicio Sesion</b></label>
    </div>

      <input type="text" id="fname" name="firstname" placeholder="Usuario">

    <input type="text" id="lname" name="lastname" placeholder="Contraseña">
  
    <div style="margin:0 auto;width:100%">
        <input type="submit" value="Registrarse" style="float: left"> 
        <input type="submit" value="Iniciar Sesion" style="float:right"></div>
  </form>
</div>

</body>
</html>
