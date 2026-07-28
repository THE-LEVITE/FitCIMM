package Modelo;

public class ReporteRecaudo {

    private int idPlan;
    private String nombrePlan;
    private int cantidad;
    private double totalRecaudado;

    public ReporteRecaudo() {
    }

    public ReporteRecaudo(int idPlan, String nombrePlan, int cantidad, double totalRecaudado) {
        this.idPlan = idPlan;
        this.nombrePlan = nombrePlan;
        this.cantidad = cantidad;
        this.totalRecaudado = totalRecaudado;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public String getNombrePlan() {
        return nombrePlan;
    }

    public void setNombrePlan(String nombrePlan) {
        this.nombrePlan = nombrePlan;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getTotalRecaudado() {
        return totalRecaudado;
    }

    public void setTotalRecaudado(double totalRecaudado) {
        this.totalRecaudado = totalRecaudado;
    }

    @Override
    public String toString() {
        return "ReporteRecaudo{" + "idPlan=" + idPlan + ", nombrePlan=" + nombrePlan
                + ", cantidad=" + cantidad + ", totalRecaudado=" + totalRecaudado + '}';
    }
}
