<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubMenu" Runat="Server">
    <div class="home">
			<div class="home_container d-flex flex-column align-items-center justify-content-end">
				<div class="home_content text-center">
					<div class="home_title"><i class="fas fa-user-edit"></i>&nbsp;&nbsp;Registro de Usuario en SimuladorBee.xyz</div>
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
					       <h4>Crea tu cuenta personal</h4>
                            <hr />
						        <div class="billing">
							        <div class="checkout_title">Ingresa la siguiente informacion</div>
							        <div class="checkout_form_container checkout_form">
                                            <div class="row">
                                                <div class="col-lg-12">
										            <input type="text" id="nick_name"  style="cursor:pointer" autocomplete="off" placeholder="Ingrese su Nombre de Usuario" class="checkout_input validacion">
                                                    <div id="nick_nameVal" class="invalid-tooltip">
                                                    </div>
                                                </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
										            <input type="text" id="name"  style="cursor:pointer" autocomplete="off" placeholder="Nombre" class="checkout_input validacion2">
                                                    <div id="nameVal" class="invalid-tooltip">
                                                    </div>
                                                </div>
									        </div>	
									        <div class="row" style="margin-bottom: 0px;">
										        <div class="col-lg-6" style="margin-bottom: 20px;">
											            <input type="text" id="AppPaterno" class="checkout_input validacion3" autocomplete="off" style="cursor:pointer" placeholder="Apellido Paterno" required="required">
                                                        <div id="AppPatVal" class="invalid-tooltip">
                                                        </div>
										        </div>
										        <div class="col-lg-6" style="margin-bottom: 20px;">									        
											            <input type="text" id="AppMaterno" class="checkout_input validacion4" autocomplete="off"  style="cursor:pointer" placeholder="Apellido Materno" required="required">
                                                        <div id="AppMatVal" class="invalid-tooltip">
                                                        </div>
                                                </div>
									        </div>		
                                            <div class="row">
                                                <div class="col-lg-12"> <!--https://www.ses.sep.gob.mx/instituciones.html-->
										           <select name="checkout_country" id="Institucion" class="dropdown_item_select checkout_input"  style="cursor:pointer" required>
                                                    <option selected value="">Seleccione Institucion Educativa</option>
                                                    <optgroup label="Universidades Públicas Federales">
                                                        <option value="Universidad Nacional Autónoma de México (UNAM)">Universidad Nacional Autónoma de México (UNAM)</option>
                                                        <option value="Instituto Politécnico Nacional (IPN)">Instituto Politécnico Nacional (IPN)</option>
                                                        <option value="Universidad Autónoma Metropolitana (UAM)">Universidad Autónoma Metropolitana (UAM)</option>
                                                        <option value="Universidad Autónoma Agraria Antonio Narro (UAAAN)">Universidad Autónoma Agraria Antonio Narro (UAAAN)</option>
                                                        <option value="Universidad Autónoma de Chapingo (UACh)">Universidad Autónoma de Chapingo (UACh)</option>
                                                        <option value="Universidad Abierta y a Distancia de México (UnADM)">Universidad Abierta y a Distancia de México (UnADM)</option>
                                                        <option value="Universidad Pedagógica Nacional (UPN)">Universidad Pedagógica Nacional (UPN)</option>
                                                        <option value="El Colegio de México (COLMEX)">El Colegio de México (COLMEX)</option>
                                                        <option value="Centro de Investigación y Docencia Económicas, A.C. (CIDE)">Centro de Investigación y Docencia Económicas, A.C. (CIDE)</option>
                                                     </optgroup>
                                                     <optgroup label="Universidades Públicas Estatales">
                                                        <option value="Universidad Autónoma de Aguascalientes">Universidad Autónoma de Aguascalientes</option>
                                                        <option value="Universidad Autónoma de Baja California">Universidad Autónoma de Baja California</option>
                                                        <option value="Universidad Autónoma de Baja California Sur">Universidad Autónoma de Baja California Sur</option>
                                                        <option value="Universidad Autónoma del Carmen">Universidad Autónoma de Campeche</option>
                                                        <option value="Universidad Autónoma del Carmen">Universidad Autónoma del Carmen</option>
                                                        <option value="Universidad Autónoma de Coahuila">Universidad Autónoma de Coahuila</option>
                                                        <option value="Universidad Autónoma de Chiapas">Universidad Autónoma de Chiapas</option>
                                                        <option value="Universidad Autónoma de Chihuahua">Universidad Autónoma de Chihuahua</option>
                                                        <option value="Universidad Autónoma de Ciudad Juárez">Universidad Autónoma de Ciudad Juárez</option>
                                                        <option value="Universidad de Guanajuato">Universidad de Guanajuato</option>
                                                        <option value="Universidad Autónoma de Guerrero">Universidad Autónoma de Guerrero</option>
                                                        <option value="Universidad Autónoma del Estado de Hidalgo">Universidad Autónoma del Estado de Hidalgo</option>
                                                        <option value="Universidad de Guadalajara">Universidad de Guadalajara</option>
                                                        <option value="Universidad Autónoma del Estado de México">Universidad Autónoma del Estado de México</option>
                                                        <option value="Universidad de Michoacana de San Nicolás Hidalgo">Universidad de Michoacana de San Nicolás Hidalgo</option>
                                                        <option value="Universidad Autónoma del Estado de Morelos">Universidad Autónoma del Estado de Morelos</option>
                                                        <option value="Universidad Autónoma de Nayarit">Universidad Autónoma de Nayarit</option>
                                                        <option value="Universidad Autónoma de Nuevo León">Universidad Autónoma de Nuevo León</option>
                                                        <option value="Universidad Autónoma 'Benito Juárez' de Oaxaca">Universidad Autónoma "Benito Juárez" de Oaxaca</option>
                                                        <option value="Benemérita Universidad Autónoma de Puebla">Benemérita Universidad Autónoma de Puebla</option>
                                                        <option value="Universidad Autónoma de Querétaro">Universidad Autónoma de Querétaro</option>
                                                        <option value="Universidad Autónoma de Quintana Roo">Universidad Autónoma de Quintana Roo</option>
                                                        <option value="Universidad Autónoma de San Luis Potosí">Universidad Autónoma de San Luis Potosí</option>
                                                        <option value="Universidad Autónoma de Sinaloa">Universidad Autónoma de Sinaloa</option>
                                                        <option value="Universidad Juárez del Estado de Durango">Universidad de Sonora</option>
                                                        <option value="Instituto Tecnológico de Sonora">Instituto Tecnológico de Sonora</option>
                                                        <option value="Universidad Juárez Autónoma de Tabasco">Universidad Juárez Autónoma de Tabasco</option>
                                                        <option value="Universidad Autónoma de Tamaulipas">Universidad Autónoma de Tamaulipas</option>
                                                        <option value="Universidad Autónoma de Tlaxcala">Universidad Autónoma de Tlaxcala</option>
                                                        <option value="Universidad Veracruzana">Universidad Veracruzana</option>
                                                        <option value="Universidad Autónoma de Yucatán">Universidad Autónoma de Yucatán</option>
                                                        <option value="Universidad Autónoma de Zacatecas">Universidad Autónoma de Zacatecas</option>
                                                     </optgroup>  
                                                     <option value="Otro">Otro</option>
                                                   </select>
                                                    <div id="InstitucionVal" class="invalid-tooltip">
                                                    </div>
                                                </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
										            <select name="checkout_country" id="country" class="dropdown_item_select checkout_input"  style="cursor:pointer" required>
											            <option selected value="">Seleccione su pais</option>
                                                        <option value="AF">Afganistán</option>
                                                        <option value="AL">Albania</option>
                                                        <option value="DE">Alemania</option>
                                                        <option value="AD">Andorra</option>
                                                        <option value="AO">Angola</option>
                                                        <option value="AI">Anguilla</option>
                                                        <option value="AQ">Antártida</option>
                                                        <option value="AG">Antigua y Barbuda</option>
                                                        <option value="AN">Antillas Holandesas</option>
                                                        <option value="SA">Arabia Saudí</option>
                                                        <option value="DZ">Argelia</option>
                                                        <option value="AR">Argentina</option>
                                                        <option value="AM">Armenia</option>
                                                        <option value="AW">Aruba</option>
                                                        <option value="AU">Australia</option>
                                                        <option value="AT">Austria</option>
                                                        <option value="AZ">Azerbaiyán</option>
                                                        <option value="BS">Bahamas</option>
                                                        <option value="BH">Bahrein</option>
                                                        <option value="BD">Bangladesh</option>
                                                        <option value="BB">Barbados</option>
                                                        <option value="BE">Bélgica</option>
                                                        <option value="BZ">Belice</option>
                                                        <option value="BJ">Benin</option>
                                                        <option value="BM">Bermudas</option>
                                                        <option value="BY">Bielorrusia</option>
                                                        <option value="MM">Birmania</option>
                                                        <option value="BO">Bolivia</option>
                                                        <option value="BA">Bosnia y Herzegovina</option>
                                                        <option value="BW">Botswana</option>
                                                        <option value="BR">Brasil</option>
                                                        <option value="BN">Brunei</option>
                                                        <option value="BG">Bulgaria</option>
                                                        <option value="BF">Burkina Faso</option>
                                                        <option value="BI">Burundi</option>
                                                        <option value="BT">Bután</option>
                                                        <option value="CV">Cabo Verde</option>
                                                        <option value="KH">Camboya</option>
                                                        <option value="CM">Camerún</option>
                                                        <option value="CA">Canadá</option>
                                                        <option value="TD">Chad</option>
                                                        <option value="CL">Chile</option>
                                                        <option value="CN">China</option>
                                                        <option value="CY">Chipre</option>
                                                        <option value="VA">Ciudad del Vaticano (Santa Sede)</option>
                                                        <option value="CO">Colombia</option>
                                                        <option value="KM">Comores</option>
                                                        <option value="CG">Congo</option>
                                                        <option value="CD">Congo, República Democrática del</option>
                                                        <option value="KR">Corea</option>
                                                        <option value="KP">Corea del Norte</option>
                                                        <option value="CI">Costa de Marfíl</option>
                                                        <option value="CR">Costa Rica</option>
                                                        <option value="HR">Croacia (Hrvatska)</option>
                                                        <option value="CU">Cuba</option>
                                                        <option value="DK">Dinamarca</option>
                                                        <option value="DJ">Djibouti</option>
                                                        <option value="DM">Dominica</option>
                                                        <option value="EC">Ecuador</option>
                                                        <option value="EG">Egipto</option>
                                                        <option value="SV">El Salvador</option>
                                                        <option value="AE">Emiratos Árabes Unidos</option>
                                                        <option value="ER">Eritrea</option>
                                                        <option value="SI">Eslovenia</option>
                                                        <option value="ES">España</option>
                                                        <option value="US">Estados Unidos</option>
                                                        <option value="EE">Estonia</option>
                                                        <option value="ET">Etiopía</option>
                                                        <option value="FJ">Fiji</option>
                                                        <option value="PH">Filipinas</option>
                                                        <option value="FI">Finlandia</option>
                                                        <option value="FR">Francia</option>
                                                        <option value="GA">Gabón</option>
                                                        <option value="GM">Gambia</option>
                                                        <option value="GE">Georgia</option>
                                                        <option value="GH">Ghana</option>
                                                        <option value="GI">Gibraltar</option>
                                                        <option value="GD">Granada</option>
                                                        <option value="GR">Grecia</option>
                                                        <option value="GL">Groenlandia</option>
                                                        <option value="GP">Guadalupe</option>
                                                        <option value="GU">Guam</option>
                                                        <option value="GT">Guatemala</option>
                                                        <option value="GY">Guayana</option>
                                                        <option value="GF">Guayana Francesa</option>
                                                        <option value="GN">Guinea</option>
                                                        <option value="GQ">Guinea Ecuatorial</option>
                                                        <option value="GW">Guinea-Bissau</option>
                                                        <option value="HT">Haití</option>
                                                        <option value="HN">Honduras</option>
                                                        <option value="HU">Hungría</option>
                                                        <option value="IN">India</option>
                                                        <option value="ID">Indonesia</option>
                                                        <option value="IQ">Irak</option>
                                                        <option value="IR">Irán</option>
                                                        <option value="IE">Irlanda</option>
                                                        <option value="BV">Isla Bouvet</option>
                                                        <option value="CX">Isla de Christmas</option>
                                                        <option value="IS">Islandia</option>
                                                        <option value="KY">Islas Caimán</option>
                                                        <option value="CK">Islas Cook</option>
                                                        <option value="CC">Islas de Cocos o Keeling</option>
                                                        <option value="FO">Islas Faroe</option>
                                                        <option value="HM">Islas Heard y McDonald</option>
                                                        <option value="FK">Islas Malvinas</option>
                                                        <option value="MP">Islas Marianas del Norte</option>
                                                        <option value="MH">Islas Marshall</option>
                                                        <option value="UM">Islas menores de Estados Unidos</option>
                                                        <option value="PW">Islas Palau</option>
                                                        <option value="SB">Islas Salomón</option>
                                                        <option value="SJ">Islas Svalbard y Jan Mayen</option>
                                                        <option value="TK">Islas Tokelau</option>
                                                        <option value="TC">Islas Turks y Caicos</option>
                                                        <option value="VI">Islas Vírgenes (EEUU)</option>
                                                        <option value="VG">Islas Vírgenes (Reino Unido)</option>
                                                        <option value="WF">Islas Wallis y Futuna</option>
                                                        <option value="IL">Israel</option>
                                                        <option value="IT">Italia</option>
                                                        <option value="JM">Jamaica</option>
                                                        <option value="JP">Japón</option>
                                                        <option value="JO">Jordania</option>
                                                        <option value="KZ">Kazajistán</option>
                                                        <option value="KE">Kenia</option>
                                                        <option value="KG">Kirguizistán</option>
                                                        <option value="KI">Kiribati</option>
                                                        <option value="KW">Kuwait</option>
                                                        <option value="LA">Laos</option>
                                                        <option value="LS">Lesotho</option>
                                                        <option value="LV">Letonia</option>
                                                        <option value="LB">Líbano</option>
                                                        <option value="LR">Liberia</option>
                                                        <option value="LY">Libia</option>
                                                        <option value="LI">Liechtenstein</option>
                                                        <option value="LT">Lituania</option>
                                                        <option value="LU">Luxemburgo</option>
                                                        <option value="MK">Macedonia, Ex-República Yugoslava de</option>
                                                        <option value="MG">Madagascar</option>
                                                        <option value="MY">Malasia</option>
                                                        <option value="MW">Malawi</option>
                                                        <option value="MV">Maldivas</option>
                                                        <option value="ML">Malí</option>
                                                        <option value="MT">Malta</option>
                                                        <option value="MA">Marruecos</option>
                                                        <option value="MQ">Martinica</option>
                                                        <option value="MU">Mauricio</option>
                                                        <option value="MR">Mauritania</option>
                                                        <option value="YT">Mayotte</option>
                                                        <option value="MX">México</option>
                                                        <option value="FM">Micronesia</option>
                                                        <option value="MD">Moldavia</option>
                                                        <option value="MC">Mónaco</option>
                                                        <option value="MN">Mongolia</option>
                                                        <option value="MS">Montserrat</option>
                                                        <option value="MZ">Mozambique</option>
                                                        <option value="NA">Namibia</option>
                                                        <option value="NR">Nauru</option>
                                                        <option value="NP">Nepal</option>
                                                        <option value="NI">Nicaragua</option>
                                                        <option value="NE">Níger</option>
                                                        <option value="NG">Nigeria</option>
                                                        <option value="NU">Niue</option>
                                                        <option value="NF">Norfolk</option>
                                                        <option value="NO">Noruega</option>
                                                        <option value="NC">Nueva Caledonia</option>
                                                        <option value="NZ">Nueva Zelanda</option>
                                                        <option value="OM">Omán</option>
                                                        <option value="NL">Países Bajos</option>
                                                        <option value="PA">Panamá</option>
                                                        <option value="PG">Papúa Nueva Guinea</option>
                                                        <option value="PK">Paquistán</option>
                                                        <option value="PY">Paraguay</option>
                                                        <option value="PE">Perú</option>
                                                        <option value="PN">Pitcairn</option>
                                                        <option value="PF">Polinesia Francesa</option>
                                                        <option value="PL">Polonia</option>
                                                        <option value="PT">Portugal</option>
                                                        <option value="PR">Puerto Rico</option>
                                                        <option value="QA">Qatar</option>
                                                        <option value="UK">Reino Unido</option>
                                                        <option value="CF">República Centroafricana</option>
                                                        <option value="CZ">República Checa</option>
                                                        <option value="ZA">República de Sudáfrica</option>
                                                        <option value="DO">República Dominicana</option>
                                                        <option value="SK">República Eslovaca</option>
                                                        <option value="RE">Reunión</option>
                                                        <option value="RW">Ruanda</option>
                                                        <option value="RO">Rumania</option>
                                                        <option value="RU">Rusia</option>
                                                        <option value="EH">Sahara Occidental</option>
                                                        <option value="KN">Saint Kitts y Nevis</option>
                                                        <option value="WS">Samoa</option>
                                                        <option value="AS">Samoa Americana</option>
                                                        <option value="SM">San Marino</option>
                                                        <option value="VC">San Vicente y Granadinas</option>
                                                        <option value="SH">Santa Helena</option>
                                                        <option value="LC">Santa Lucía</option>
                                                        <option value="ST">Santo Tomé y Príncipe</option>
                                                        <option value="SN">Senegal</option>
                                                        <option value="SC">Seychelles</option>
                                                        <option value="SL">Sierra Leona</option>
                                                        <option value="SG">Singapur</option>
                                                        <option value="SY">Siria</option>
                                                        <option value="SO">Somalia</option>
                                                        <option value="LK">Sri Lanka</option>
                                                        <option value="PM">St Pierre y Miquelon</option>
                                                        <option value="SZ">Suazilandia</option>
                                                        <option value="SD">Sudán</option>
                                                        <option value="SE">Suecia</option>
                                                        <option value="CH">Suiza</option>
                                                        <option value="SR">Surinam</option>
                                                        <option value="TH">Tailandia</option>
                                                        <option value="TW">Taiwán</option>
                                                        <option value="TZ">Tanzania</option>
                                                        <option value="TJ">Tayikistán</option>
                                                        <option value="TF">Territorios franceses del Sur</option>
                                                        <option value="TP">Timor Oriental</option>
                                                        <option value="TG">Togo</option>
                                                        <option value="TO">Tonga</option>
                                                        <option value="TT">Trinidad y Tobago</option>
                                                        <option value="TN">Túnez</option>
                                                        <option value="TM">Turkmenistán</option>
                                                        <option value="TR">Turquía</option>
                                                        <option value="TV">Tuvalu</option>
                                                        <option value="UA">Ucrania</option>
                                                        <option value="UG">Uganda</option>
                                                        <option value="UY">Uruguay</option>
                                                        <option value="UZ">Uzbekistán</option>
                                                        <option value="VU">Vanuatu</option>
                                                        <option value="VE">Venezuela</option>
                                                        <option value="VN">Vietnam</option>
                                                        <option value="YE">Yemen</option>
                                                        <option value="YU">Yugoslavia</option>
                                                        <option value="ZM">Zambia</option>
                                                        <option value="ZW">Zimbabue</option>
										            </select>
                                                    <div id="countryVal" class="invalid-tooltip">
                                                    </div>
                                                </div>
									        </div>	
                                             <div class="row" style="margin-bottom: 0px;">
										        <div class="col-lg-6" style="margin-bottom: 20px;">
											        <input type="password" id="password" class="checkout_input"  autocomplete="new-password" style="cursor:pointer" placeholder="Ingrese su contraseña" required="required">
                                                    <div id="passwVal" class="invalid-tooltip">
                                                    </div>
                                                    <div id="passwValMod" class="invalid-tooltip">
                                                    </div>
										        </div>
										        <div class="col-lg-6" style="margin-bottom: 20px;">
											        <input type="password" id="password_repit" class="checkout_input" autocomplete="new-password" style="cursor:pointer" placeholder="Repita su contraseña" required="required" readonly>
										            <div id="password_repitVal" class="invalid-tooltip">
                                                    </div>
                                                </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
										           <input type="text" id="phone" class="checkout_input validacion5" autocomplete="off" style="cursor:pointer" placeholder="Numero Telefonico" required="required">
                                                    <div id="phoneVal" class="invalid-tooltip">
                                                    </div>
                                                </div>
									        </div>	
                                            <div class="row">
                                                <div class="col-lg-12">
										            <input type="text" id="email" class="checkout_input" autocomplete="off"  style="cursor:pointer" placeholder="Correo Electronico" required="required">
                                                    <div id="emailVal" class="invalid-tooltip">
                                                    </div>
                                                </div>
									        </div>		
                                           <div class="row">  
                                                        <div class="col-1.5" style="margin-left: 30px;">
                                                            <label class="c-switch c-switch-dark">
                                                              <input type="checkbox" id="cb_TeryCond" name="RememberMe" class="c-switch-input" value="1">
                                                              <span class="c-switch-slider"></span>
                                                               
                                                            </label>                                   
                                                        </div>  
                                                        <div class="col" id="cb_TeryCondTex"><div id="Tex">Terminos y Condiciones</div>
                                                            <div id="cb_TeryCondVal" class="invalid-tooltip">
                                                            </div>
                                                        </div> 
                                                        
                                                
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
    <!-- Registro Modal ok-->
    <div class="modal fade" id="modalRegistrook" data-anijs="if: load, on: window, do: swing animated, before: scrollReveal" >
    <div class="modal-dialog">
        <div class="modal-content">      
            <!-- Modal Header -->
            <div class="modal-header">
                    <h4 class="modal-title bounce animated" id="modalheaderok" > <i class="fa fa-check-square-o"></i>Registro Exitoso</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>        
            <!-- Modal body -->
            <div class="modal-body" id="modal-text-bodyok" >    
                <div class="row">
                        <div class="col-3" id="imgmodalok"><img src="../multimedia/correcto.gif" class="img-fluid tada animated infinite" width="100" height="100" alt="Responsive image"/></div>
                        <div class="col-9" id="texmodalok"><strong style='vertical-align: middle;'>El registro se a realizado con exito.</strong></div>                                                                        
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-dismiss="modal" id="modalok">Aceptar</button>   
            </div>
        </div>
        </div>
    </div> 
    <!-- Registro Modal ok-->
    <!-- Registro Modal-->
    <div class="modal fade" id="modalRegistro" data-anijs="if: load, on: window, do: swing animated, before: scrollReveal" >
    <div class="modal-dialog">
        <div class="modal-content">      
            <!-- Modal Header -->
            <div class="modal-header">
                    <h4 class="modal-title bounce animated" id="modalheader" > <i class="fa fa-check-square-o"></i>Error</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>        
            <!-- Modal body -->
            <div class="modal-body" id="modal-text-body" >    
                <div class="row">
                        <div class="col-3" id="imgmodal"><img src="../multimedia/alerta.gif" class="img-fluid tada animated infinite" width="100" height="100" alt="Responsive image"/></div>
                        <div class="col-9" id="texmodal"><strong style='vertical-align: middle;'>El registro fallo, intente mas tarde.</strong></div>                                                                        
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-dismiss="modal">Aceptar</button>   
            </div>
        </div>
        </div>
    </div> 
    <!-- Registro Modal -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
    <script src="../Scripts/Account/Register/greensock/TweenMax.min.js"></script>
    <script src="../Scripts/Account/Register/greensock/TimelineMax.min.js"></script>
    <script src="../Scripts/Account/Register/scrollmagic/ScrollMagic.min.js"></script>
    <script src="../Scripts/Account/Register/greensock/animation.gsap.min.js"></script>
    <script src="../Scripts/jquery.easing.1.3.js"></script>
    <script src="../Scripts/Account/Register/parallax-js-master/parallax.min.js"></script>
    <script src="../Scripts/Account/Register/registro.js"></script>
    <script src="../Scripts/Account/Enlaces.js"></script>
</asp:Content>
