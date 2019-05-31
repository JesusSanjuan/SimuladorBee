<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../Content/Register/checkout.css" rel="stylesheet" />    
    <link href="../Content/Register/checkout_responsive.css" rel="stylesheet" />
    <link href="../Content/Register/util.css" rel="stylesheet" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div style="margin-top: 30px;">    
        <div class="row">
            <div class="col-md-12">
        <h2><i class="fas fa-user-edit"></i> Trabaja en SimuladorBee.xyz</h2>
                </div>
            </div>
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
										            <input type="text" id="checkout_company" placeholder="Compañia" class="checkout_input">
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
                                                    <!-- Phone no -->
										           <input type="phone" id="checkout_phone" class="checkout_input" placeholder="Numero Telefonico" required="required">
                                                    </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <!-- Email -->
										            <input type="phone" id="checkout_email" class="checkout_input" placeholder="Correo Electronico" required="required">
                                                </div>
									        </div>	
                                        <div class="row">
                                                <div class="col-lg-12">
                                                    <!-- Email -->
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
										             <div class="checkout_button trans_200"><a>Registrarse</a></div>
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
    <script src="../Scripts/Register/animation.gsap.min.js"></script>
    <script src="../Scripts/Register/checkout.js"></script>
    <script src="../Scripts/Register/easing.js"></script>
    <script src="../Scripts/Register/parallax.min.js"></script>
    <script src="../Scripts/Register/ScrollMagic.min.js"></script>
    <script src="../Scripts/Register/ScrollToPlugin.min.js"></script>
    <script src="../Scripts/Register/TimelineMax.min.js"></script>
    <script src="../Scripts/Register/TweenMax.min.js"></script>
</asp:Content>
