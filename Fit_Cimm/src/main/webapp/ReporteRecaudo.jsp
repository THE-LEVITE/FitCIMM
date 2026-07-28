<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Recaudado por Plan - FitCIMM</title>


        <jsp:include page="header.jsp" />

        <style>
            .main-content {
                padding: 30px 40px;
            }

            .page-header-custom {
                padding: 0 0 18px 0;
                margin-bottom: 22px;
                border-bottom: 2px solid #e9ecef;
            }

            .page-title {
                font-size: 24px;
                color: #1a2a3a;
                font-weight: 700;
                margin: 0;
            }

            .page-title i {
                color: #4a6fa5;
                margin-right: 10px;
            }

            .page-subtitle {
                font-size: 13px;
                color: #8a9bb5;
                margin-top: 2px;
            }

            .card-custom {
                border: 1px solid #e9ecef;
                border-radius: 10px;
                box-shadow: 0 1px 4px rgba(0,0,0,0.04);
                background: #ffffff;
                margin-bottom: 20px;
            }

            .card-custom .card-header {
                background: #f8fafc;
                border-bottom: 1px solid #e9ecef;
                padding: 14px 20px;
                font-weight: 600;
                font-size: 14px;
                color: #1a2a3a;
                border-radius: 10px 10px 0 0;
            }

            .card-custom .card-header i {
                color: #4a6fa5;
                margin-right: 8px;
            }

            .card-custom .card-body {
                padding: 20px 24px;
            }

            .form-control-lg-custom {
                padding: 10px 16px;
                font-size: 14px;
                height: 44px;
                border-radius: 6px;
                border: 1px solid #e2e8f0;
                transition: all 0.2s ease;
            }

            .form-control-lg-custom:focus {
                border-color: #4a6fa5;
                box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.12);
                outline: none;
            }

            .form-label {
                font-size: 13px;
                font-weight: 500;
                color: #2d3748;
                margin-bottom: 4px;
            }

            .btn-custom {
                height: 44px;
                padding: 0 24px;
                font-size: 14px;
                border-radius: 6px;
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                white-space: nowrap;
            }

            .btn-custom i {
                font-size: 16px;
            }

            .btn-primary-custom {
                background: #1a56db;
                border-color: #1a56db;
                color: #fff;
            }

            .btn-primary-custom:hover {
                background: #1445b0;
                border-color: #1445b0;
                color: #fff;
            }

            .table-container {
                overflow-x: auto;
            }

            .table-container .table {
                margin-bottom: 0;
                font-size: 13.5px;
            }

            .table-container .table thead th {
                background: #f8fafc;
                color: #1a2a3a;
                font-weight: 600;
                font-size: 12.5px;
                text-transform: uppercase;
                letter-spacing: 0.3px;
                padding: 12px 14px;
                border-bottom: 2px solid #e9ecef;
                white-space: nowrap;
            }

            .table-container .table tbody td {
                padding: 11px 14px;
                vertical-align: middle;
                border-bottom: 1px solid #f0f2f5;
            }

            .table-container .table tbody tr:hover {
                background: #f8fafc;
            }

            .table-container .table tbody tr:last-child td {
                border-bottom: none;
            }

            .badge-plan {
                display: inline-block;
                font-size: 12px;
                font-weight: 600;
                color: #1a2a3a;
                background: #e9ecef;
                padding: 4px 14px;
                border-radius: 10px;
            }

            .badge-count {
                background: #ebf4ff;
                color: #1a56db;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
            }

            .badge-total {
                background: #ecfdf5;
                color: #0f7b3e;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
            }

            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            .alert-custom i {
                font-size: 16px;
            }

            .empty-state {
                padding: 40px 20px;
                text-align: center;
                color: #8a9bb5;
            }

            .empty-state i {
                font-size: 48px;
                display: block;
                margin-bottom: 12px;
                color: #dce3ec;
            }

            .total-general {
                background: #f8fafc;
                padding: 12px 20px;
                border-radius: 8px;
                font-size: 15px;
                font-weight: 600;
                color: #1a2a3a;
                display: inline-flex;
                align-items: center;
                gap: 12px;
            }

            .total-general .amount {
                color: #0f7b3e;
                font-size: 18px;
            }

            .btn-back {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 8px 18px;
                font-size: 13px;
                border-radius: 6px;
                font-weight: 500;
                color: #4a5568;
                border: 1px solid #dce3ec;
                background: #ffffff;
                text-decoration: none;
                transition: all 0.2s ease;
            }

            .btn-back:hover {
                background: #f1f3f5;
                color: #1a2a3a;
            }

            .btn-back i {
                font-size: 16px;
            }

            @media (max-width: 768px) {
                .main-content {
                    padding: 16px;
                }
                .card-custom .card-body {
                    padding: 16px;
                }
                .table-container .table {
                    font-size: 12px;
                }
                .table-container .table thead th,
                .table-container .table tbody td {
                    padding: 8px 10px;
                }
                .page-title {
                    font-size: 20px;
                }
                .form-control-lg-custom {
                    height: 40px;
                    font-size: 13px;
                }
                .btn-custom {
                    height: 40px;
                    font-size: 13px;
                    padding: 0 16px;
                }
                .total-general {
                    font-size: 13px;
                    flex-wrap: wrap;
                }
                .total-general .amount {
                    font-size: 16px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <div class="page-header-custom">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                    <div>
                        <h1 class="page-title"><i class="bi bi-cash-stack text-primary"></i> Total Recaudado por Plan</h1>
                        <div class="page-subtitle">Consulta de ventas agrupadas por tipo de plan en un rango de fechas</div>
                    </div>
                    <a href="Index.jsp" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Volver al inicio
                    </a>
                </div>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>


            <div class="card-custom">
                <div class="card-header">
                    <i class="bi bi-calendar3"></i> Seleccionar Rango de Fechas
                </div>
                <div class="card-body">
                    <form action="ReporteControlador" method="GET" class="row g-3">
                        <input type="hidden" name="accion" value="recaudo">

                        <div class="col-md-5">
                            <label class="form-label">Fecha Inicio</label>
                            <input type="date" name="fechaInicio" class="form-control form-control-lg-custom" 
                                   value="${fechaInicio}">
                        </div>

                        <div class="col-md-5">
                            <label class="form-label">Fecha Fin</label>
                            <input type="date" name="fechaFin" class="form-control form-control-lg-custom" 
                                   value="${fechaFin}">
                        </div>

                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-custom btn-primary-custom w-100">
                                <i class="bi bi-search"></i> Consultar
                            </button>
                        </div>
                    </form>
                </div>
            </div>


            <c:if test="${not empty recaudos}">
                <div class="card-custom">
                    <div class="card-header">
                        <i class="bi bi-bar-chart-fill"></i> 
                        Recaudo del ${fechaInicio} al ${fechaFin}
                        <span class="badge-count">${recaudos.size()} planes</span>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width: 50px;">#</th>
                                        <th>Plan</th>
                                        <th style="text-align: center;">Cantidad Vendida</th>
                                        <th style="text-align: right;">Total Recaudado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="recaudo" items="${recaudos}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>
                                                <span class="badge-plan">${recaudo.nombrePlan}</span>
                                            </td>
                                            <td style="text-align: center;">
                                                <strong>${recaudo.cantidad}</strong>
                                            </td>
                                            <td style="text-align: right;">
                                                <strong class="text-success">$${recaudo.totalRecaudado}</strong>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>


                        <div class="p-3 border-top" style="background: #f8fafc; border-radius: 0 0 10px 10px;">
                            <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                                <div class="total-general">
                                    <i class="bi bi-cash-stack text-primary"></i>
                                    Total General
                                    <span class="amount">
                                        $<c:set var="totalGeneral" value="0" />
                                        <c:forEach var="r" items="${recaudos}">
                                            <c:set var="totalGeneral" value="${totalGeneral + r.totalRecaudado}" />
                                        </c:forEach>
                                        ${totalGeneral}
                                    </span>
                                </div>
                                <div class="text-muted" style="font-size: 13px;">
                                    <i class="bi bi-calendar3"></i>
                                    ${fechaInicio} al ${fechaFin}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty recaudos}">
                <div class="card-custom">
                    <div class="card-header">
                        <i class="bi bi-bar-chart-fill"></i> 
                        Recaudo del ${fechaInicio} al ${fechaFin}
                    </div>
                    <div class="card-body">
                        <div class="empty-state">
                            <i class="bi bi-inbox"></i>
                            <h5>No hay ventas en el rango seleccionado</h5>
                            <p class="text-muted" style="font-size: 13px;">No se encontraron membresías vendidas entre ${fechaInicio} y ${fechaFin}.</p>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>

        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(item => {
                if (item.getAttribute('href') === 'ReporteControlador?accion=recaudo') {
                    item.classList.add('active');
                }
            });
        </script>

    </body>
</html>