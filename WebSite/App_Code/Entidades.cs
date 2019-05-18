﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Amortizacion_cat
{
    public string ID_Amortizacion { get; set; }
    public string Concepto { get; set; }
    public int Porcentaje { get; set; }
}

public partial class Amortizacion_pro
{
    public string ID_Amortizacion_pro { get; set; }
    public string ID_Proyecto { get; set; }
    public string ID_Periodo { get; set; }
    public string Amortizacion { get; set; }
    public decimal Total { get; set; }

    public virtual Proyecto Proyecto { get; set; }
}

public partial class AspNetUsers
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public AspNetUsers()
    {
        this.Proyecto = new HashSet<Proyecto>();
    }

    public string Id { get; set; }
    public string Email { get; set; }
    public bool EmailConfirmed { get; set; }
    public string PasswordHash { get; set; }
    public string SecurityStamp { get; set; }
    public string PhoneNumber { get; set; }
    public bool PhoneNumberConfirmed { get; set; }
    public bool TwoFactorEnabled { get; set; }
    public Nullable<System.DateTime> LockoutEndDateUtc { get; set; }
    public bool LockoutEnabled { get; set; }
    public int AccessFailedCount { get; set; }
    public string UserName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Proyecto> Proyecto { get; set; }
}

public partial class Costos_cat
{
    public string ID_Costos { get; set; }
    public string Concepto { get; set; }
    public string Tipo { get; set; }
}

public partial class Costos_Pro
{
    public string ID_Costos_pro { get; set; }
    public string ID_Proyecto { get; set; }
    public string ID_Periodo { get; set; }
    public string Produccion { get; set; }
    public string Ventas { get; set; }
    public string Financiamiento { get; set; }
    public string Admon { get; set; }
    public decimal Total { get; set; }

    public virtual Proyecto Proyecto { get; set; }
}

public partial class FNE
{
    public string ID_FNE { get; set; }
    public string ID_Proyecto { get; set; }
    public string ID_Periodo { get; set; }
    public decimal Ingreso { get; set; }
    public decimal Total_Costo { get; set; }
    public decimal UAI { get; set; }
    public double Impuesto { get; set; }
    public decimal UDI { get; set; }
    public decimal Amortizacion { get; set; }
    public decimal Total_FNE { get; set; }

    public virtual Proyecto Proyecto { get; set; }
}

public partial class Gastos_Pro
{
    public string ID_Gastos_pro { get; set; }
    public string ID_Proyecto { get; set; }
    public string ID_Periodo { get; set; }
    public string Produccion { get; set; }
    public string Ventas { get; set; }
    public string Financiamiento { get; set; }
    public string Admon { get; set; }
    public decimal Total { get; set; }

    public virtual Proyecto Proyecto { get; set; }
}

public partial class Indicadores
{
    public string ID_Indicadores { get; set; }
    public string ID_Proyecto { get; set; }
    public Nullable<double> Inflacion_Actual { get; set; }
    public Nullable<double> Inflacion_INEGI { get; set; }
    public Nullable<double> Inflacion_Propia { get; set; }
    public string Periodo { get; set; }

    public virtual Proyecto Proyecto { get; set; }
}

public partial class indice_INPC
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public indice_INPC()
    {
        this.INPC = new HashSet<INPC>();
    }

    public string Id_indice { get; set; }
    public string descripcion_indice_base { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<INPC> INPC { get; set; }
}

public partial class Inflacion
{
    public string ID_Inflacion { get; set; }
    public string ID_Proyecto { get; set; }
    public Nullable<double> Valor_Inflacion { get; set; }
    public string Tipo { get; set; }
    public string Periodo { get; set; }

    public virtual Proyecto Proyecto { get; set; }
}

public partial class INPC
{
    public string Id { get; set; }
    public Nullable<int> anio { get; set; }
    public Nullable<double> enero { get; set; }
    public Nullable<double> febrero { get; set; }
    public Nullable<double> marzo { get; set; }
    public Nullable<double> abril { get; set; }
    public Nullable<double> mayo { get; set; }
    public Nullable<double> junio { get; set; }
    public Nullable<double> julio { get; set; }
    public Nullable<double> agosto { get; set; }
    public Nullable<double> septiembre { get; set; }
    public Nullable<double> octubre { get; set; }
    public Nullable<double> noviembre { get; set; }
    public Nullable<double> diciembre { get; set; }
    public string id_indice { get; set; }
    public string id_tipo_anio_base { get; set; }

    public virtual indice_INPC indice_INPC { get; set; }
    public virtual tipo_anio_base_INPC tipo_anio_base_INPC { get; set; }
}

public partial class Proyecto
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Proyecto()
    {
        this.Amortizacion_pro = new HashSet<Amortizacion_pro>();
        this.Costos_Pro = new HashSet<Costos_Pro>();
        this.FNE = new HashSet<FNE>();
        this.Gastos_Pro = new HashSet<Gastos_Pro>();
        this.Indicadores = new HashSet<Indicadores>();
        this.Inflacion = new HashSet<Inflacion>();
        this.Punto_Equilibrio = new HashSet<Punto_Equilibrio>();
    }

    public string ID_Proyecto { get; set; }
    public string ID_Usuario { get; set; }
    public string Nombre_Proyecto { get; set; }
    public System.DateTime Fecha_Hora { get; set; }
    public string ID_Periodo { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Amortizacion_pro> Amortizacion_pro { get; set; }
    public virtual AspNetUsers AspNetUsers { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Costos_Pro> Costos_Pro { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<FNE> FNE { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Gastos_Pro> Gastos_Pro { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Indicadores> Indicadores { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Inflacion> Inflacion { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Punto_Equilibrio> Punto_Equilibrio { get; set; }
}

public partial class Punto_Equilibrio
{
    public string ID_PE { get; set; }
    public string ID_Proyecto { get; set; }
    public Nullable<double> PE_Unidades { get; set; }
    public Nullable<decimal> PE_Pesos { get; set; }

    public virtual Proyecto Proyecto { get; set; }
}

public partial class tipo_anio_base_INPC
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public tipo_anio_base_INPC()
    {
        this.INPC = new HashSet<INPC>();
    }

    public string id_tipo_anio_base { get; set; }
    public string descripcion_tipo_anio_base { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<INPC> INPC { get; set; }
}
