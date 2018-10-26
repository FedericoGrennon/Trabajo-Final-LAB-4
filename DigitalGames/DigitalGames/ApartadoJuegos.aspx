<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ApartadoJuegos.aspx.cs" Inherits="DigitalGames.ApartadoJuegos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
          box-sizing:border-box;
        }

        body {
          margin: 0;
          font-family: Arial, Helvetica, sans-serif;
        }

        .container {
          min-height: 600px;
        }

        .row:after {
          content: "";
          display: table;
          clear: both
        }

        .column-66 {
            background-color:rgba(0,0,0,0.5);
            color: white;
            width:60%;
            padding:20px;
            min-height:600px;
        }

        .large-font {
          font-size: 48px;
        }

        .xlarge-font {
          font-size: 64px
        }

        .button {
          border: none;
          color: white;
          padding: 14px 28px;
          font-size: 16px;
          cursor: pointer;
          background-color: #4CAF50;
        }

        @media screen and (max-width: 800px) {
          .column-66,
          .column-33 {
            width: 100%;
          }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- PRIMER JUEGO -->
    <div class="container" style="background:url(https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2013/01/205245-20-mejores-juegos-wii.jpg)no-repeat bottom;background-size:cover">
      <div class="row">
        <div class="column-66">
          <h1 class="xlarge-font"><b>The App</b></h1>
          <h1 class="large-font" style="color:MediumSeaGreen;"><b>Why buy it?</b></h1>
          <p><span style="font-size:36px">Take photos like a pro.</span> You should buy this app because lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          <button class="button">Download Application</button>
        </div>
      </div>
    </div>

    <!-- SEGUNDO JUEGO -->
    <div class="container" style="background:url(https://cdn4.areajugones.es/wp-content/uploads/2017/04/counter-strike-global-offensive-810x400.png)no-repeat bottom;background-size:cover">
      <div class="row">
        <div class="column-66" style="text-align:right; float: right">
          <h1 class="xlarge-font"><b>Clarity</b></h1>
          <h1 class="large-font" style="color:red;"><b>Pixels, who?</b></h1>
          <p><span style="font-size:24px">A revolution in resolution.</span> aaaaaaaa aaaaaaaaa aaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaa aaaaaaa aaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaa</p>
          <button class="button" style="background-color:red">Read More</button>
        </div>
      </div>
    </div>

    <!-- TERCER JUEGO -->
    <div class="container" style="background:url(https://d2skuhm0vrry40.cloudfront.net/2018/articles/2018-07-30-11-26/titan-quest-review-not-all-switch-ports-are-created-equal-1532946388292.jpg/EG11/thumbnail/1920x1080/format/jpg/1987099.jpg)no-repeat bottom;background-size:cover">
      <div class="row">
        <div class="column-66">
          <h1 class="xlarge-font"><b>The App</b></h1>
          <h1 class="large-font" style="color:MediumSeaGreen;"><b>Why buy it?</b></h1>
          <p><span style="font-size:36px">Take photos like a pro.</span> You should buy this app because lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
          <button class="button">Download Application</button>
        </div>
      </div>
    </div>

    <div class="container" style="background:url(https://andaluciagame.andaluciainformacion.es/wp-content/uploads/2018/03/Quake_Champions_March_Update_01_1520518852.jpg)no-repeat bottom;background-size:cover">
      <div class="row">
        <div class="column-66" style="text-align:right; float: right">
          <h1 class="xlarge-font"><b>The App</b></h1>
          <h1 class="large-font" style="color:MediumSeaGreen;"><b>Why buy it?</b></h1>
          <p><span style="font-size:36px">Take photos like a pro.</span> You should buy this app because lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
          <button class="button">Download Application</button>
        </div>
      </div>
    </div>
</asp:Content>
