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
<asp:Content ID="Content2" ContentPlaceHolderID="Footer" Runat="Server">
     <footer class="footer">
			<div class="footer_content">
				<div class="container">
					<div class="row">						
						<!-- About -->
						<div class="col-lg-4 footer_col">
							<div class="footer_about">
								<div class="footer_logo">
									<a href="../">
										<div class="d-flex flex-row align-items-center justify-content-start">
											<div class="footer_logo_icon"> <img src="favicon.ico" width="90" height="90"  class="img-fluid" alt="Responsive image" /></div>
											<div>Simulador Bee</div>
										</div>
									</a>		
								</div>
								<div class="footer_about_text">
									<p>Aplicacion desarrollada para el aprendizaje de Negocios, Tecnologia .NET.</p>
								</div>
							</div>
						</div>

						<!-- Footer Links -->
						<div class="col-lg-4 footer_col">
							<div class="footer_menu">
								<div class="footer_title">Soporte</div>
								<ul class="footer_list">
                                    <li>
										<a href="#"><div>Servicio al Cliente<div >Acerca de..</div></div></a>
									</li>
									<li>
										<a href="#"><div style="position: relative">Servicio al Cliente<div class="footer_tag_1">En linea ahora</div></div></a>
									</li>
									<li>
										<a href="#"><div>Politica de Simulacion</div></a>
									</li>
									<li>
										<a href="#"><div>Terminos y Condiciones</div></a>
									</li>
									<li>
										<a href="#"><div>Contacto</div></a>
									</li>
								</ul>
							</div>
						</div>


						<!-- Footer Contact -->
						<div class="col-lg-4 footer_col">
							<div class="footer_contact">
								<div class="footer_title">Contacto</div>
								<div class="newsletter">
                                    <div class="newsletter_form" style="position: relative">
										<input type="email" class="newsletter_input" placeholder="Suscríbete a nuestro boletín" required="required">
										<button class="newsletter_button">+</button>
                                    </div>
								</div>
								<div class="footer_social">
									<div class="footer_title">Social</div>
									<ul class="footer_social_list d-flex flex-row align-items-start justify-content-start">
										<li><a href="#"><i class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fab fa-youtube" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fab fa-google" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fab fa-instagram" aria-hidden ="true"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer_bar">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="footer_bar_content d-flex flex-md-row flex-column align-items-center justify-content-start">
								<div class="copyright order-md-1 order-2">
                                            Copyright &copy; Simuladorbee.xyz <script>document.write(new Date().getFullYear());</script> Todos los derechos reservados | Este diseño fue desarrollado <i class="far fa-file-code"></i> por <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                </div>
								<nav class="footer_nav ml-md-auto order-md-2 order-1">
									<ul class="d-flex flex-row align-items-center justify-content-start">
										<li><a href="#">Contacto</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>

 </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
    <script src="../Scripts/Register/greensock/TweenMax.min.js"></script>
    <script src="../Scripts/Register/greensock/TimelineMax.min.js"></script>
    <script src="../Scripts/Register/scrollmagic/ScrollMagic.min.js"></script>
    <script src="../Scripts/Register/greensock/animation.gsap.min.js"></script>
    <script src="../Scripts/jquery.easing.1.3.js"></script>
    <script src="../Scripts/Register/parallax-js-master/parallax.min.js"></script>
    <script src="../Scripts/Register/checkout.js"></script>
</asp:Content>
