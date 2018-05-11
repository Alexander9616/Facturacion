package Modelo;
import Controlador.Conexion;
public class Negocios 
{
    private String Codigo;
    private String Codigo_cliente;
    public String getCodigo() 
    {
        return Codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String Codigo_producto) 
    {
        this.Codigo = Codigo_producto;
    }

    /**
     * @return the codigo cliente
     */
    public String getCodigo_cliente() 
    {
        return Codigo_cliente;
    }

    /**
     * @param codigo the codigo cliente to set
     */
    public void setCodigo_cliente(String Codigo_cliente) 
    {
        this.Codigo_cliente = Codigo_cliente;
    }
    public boolean insertartblFacturas(){        
        String consultaSQl = "";
        consultaSQl = "insert into tblFactura(codigo,codCliente) ";
        consultaSQl += "values('"+getCodigo()+"','"+getCodigo_cliente()+"')";
        Conexion objControlador = new Conexion();
        return objControlador.ejecutarConsultaSql(consultaSQl);
    } 
}
