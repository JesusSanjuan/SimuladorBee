<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubMenu" Runat="Server">
    <div class="home">
			<div class="home_container d-flex flex-column align-items-center justify-content-end">
				<div class="home_content text-center">
					<div class="home_title"><i class="fas fa-user-edit"></i>Registro de Usuario en SimuladorBee.xyz</div>
					<div class="breadcrumbs d-flex flex-column align-items-center justify-content-center">
						<ul class="d-flex flex-row align-items-start justify-content-start text-center">
							<li><a href="../Default">Inicio</a></li>
							<li>Registro</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div style="margin-top: 30px;"> 
			<div class="container">
				<div class="row">
					<div class="col-md-9" style="padding-right: 1px; padding-left: 1px;">
					       <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Crea tu cuenta personal</h4>
                            <hr />
						        <div class="billing">
							        <div class="checkout_title">Ingresa la siguiente informacion</div>
							        <div class="checkout_form_container checkout_form">
									        <div class="row" >
										        <div class="col-lg-6">
											        <!-- Name -->
											        <input type="text" id="checkout_name" class="checkout_input" placeholder="Nombre" required="required">
										        </div>
										        <div class="col-lg-6">
											        <!-- Last Name -->
											        <input type="text" id="checkout_last_name" class="checkout_input" placeholder="Apellido" required="required">
										        </div>
									        </div>		
                                            <div class="row">
										        <!-- Company -->
                                                <div class="col-lg-12">
										            <input type="text" id="checkout_company" placeholder="Institucion Educativa" class="checkout_input">
                                                </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
										            <!-- Country -->
										            <select name="checkout_country" id="checkout_country" class="dropdown_item_select checkout_input" require="required">
											            <option>Pais</option>
                                                        <option>Mexico</option>
											            <option>Lithuania</option>
											            <option>Sweden</option>
											            <option>UK</option>
											            <option>Italy</option>
										            </select>
                                                </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
										           <input type="phone" id="checkout_phone" class="checkout_input" placeholder="Numero Telefonico" required="required">
                                                </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
										            <input type="phone" id="checkout_email" class="checkout_input" placeholder="Correo Electronico" required="required">
                                                </div>
									        </div>		
                                            <div class="checkout_extra">
											        <li class="billing_info d-flex flex-row align-items-center justify-content-start">
												        <label class="checkbox_container">
													        <input type="checkbox" id="cb_1" name="billing_checkbox" class="billing_checkbox">
													        <span class="checkbox_mark"></span>
													        <span class="checkbox_text">Terminos y Condiciones</span>
												        </label>
											        </li>
									        </div>
                                            <div class="row">
                                                <div class="col-lg-12">
										             <div class="checkout_button trans_200" id="registro" style="cursor:pointer"><a>Registrarse</a></div>
                                                </div>
									        </div>	
							        </div>
						        </div>
                    </div>
                    <div class="col-md-3">
                         <h4>¿Qué estás esperando?</h4>
                            <hr/>
                         <p align="justify">
                            Tu empresa no puede darse el lujo de perder tiempo y dinero en... Asi que...
                         </p>
                         <h5>Ahorra tiempo</h5>
                         <h5>Aumenta la productividad</h5>
                         <h5>Reduce los costos</h5>
                    </div>					
				</div>
			</div>
   </div>   

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
    <script src="../Scripts/Account/Register/greensock/TweenMax.min.js"></script>
    <script src="../Scripts/Account/Register/greensock/TimelineMax.min.js"></script>
    <script src="../Scripts/Account/Register/scrollmagic/ScrollMagic.min.js"></script>
    <script src="../Scripts/Account/Register/greensock/animation.gsap.min.js"></script>
    <script src="../Scripts/jquery.easing.1.3.js"></script>
    <script src="../Scripts/Account/Register/parallax-js-master/parallax.min.js"></script>
    <script src="../Scripts/Account/Register/registro.js"></script>
</asp:Content>
