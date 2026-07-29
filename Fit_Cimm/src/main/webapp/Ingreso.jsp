<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Ingreso - FitCIMM</title>


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

            .btn-secondary-custom {
                background: #6c757d;
                border-color: #6c757d;
                color: #fff;
            }

            .btn-secondary-custom:hover {
                background: #5a6268;
                border-color: #5a6268;
                color: #fff;
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


            .table-container {
                background: #ffffff;
                border-radius: 10px;
                border: 1px solid #e9ecef;
                overflow: hidden;
                box-shadow: 0 1px 4px rgba(0,0,0,0.04);
                margin-top: 16px;
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

            .count-badge {
                background: #ebf4ff;
                color: #1a56db;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
            }

            .badge-time {
                background: #e9ecef;
                color: #1a2a3a;
                padding: 2px 12px;
                border-radius: 10px;
                font-size: 12px;
            }


            @media (max-width: 768px) {
                .main-content {
                    padding: 16px;
                }
                .card-custom .card-body {
                    padding: 16px;
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
                .page-title {
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <!-- Encabezado -->
            <div class="page-header-custom">
                <h1 class="page-title"><i class="bi bi-door-open"></i> Control de Ingreso</h1>
                <div class="page-subtitle">Registro de entrada de socios al gimnasio</div>
            </div>


            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${not empty textoEnviado}">
                <div class="alert alert-info alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-info-circle-fill me-2"></i>
                    ${textoEnviado}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${not empty textoEnviado2}">
                <div class="alert alert-success alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-person-check-fill me-2"></i>
                    ${textoEnviado2}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            >
            <div class="card-custom">
                <div class="card-header">
                    <i class="bi bi-door-open"></i> Registrar Ingreso
                </div>
                <div class="card-body">
                    <form action="IngresoControl" method="POST" class="row g-3">
                        <input type="hidden" name="accion" value="registrarIngreso">

                        <div class="col-md-8">
                            <label class="form-label">Documento del Socio</label>
                            <input type="text" name="ingreso" class="form-control form-control-lg-custom" 
                                   placeholder="Ingrese el número de documento" required>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <button type="submit" class="btn btn-custom btn-primary-custom w-100">
                                <i class="bi bi-door-open"></i> Ingresar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            >
            <div class="card-custom">
                <div class="card-header">
                    <i class="bi bi-calendar3"></i> Consultar Ingresos por Fecha
                </div>
                <div class="card-body">
                    <form action="IngresoControl" method="POST" class="row g-3">
                        <input type="hidden" name="accion" value="buscarFecha">

                        <div class="col-md-8">
                            <label class="form-label">Seleccione una fecha</label>
                            <input type="date" name="busquedaFecha" class="form-control form-control-lg-custom" required>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <button type="submit" class="btn btn-custom btn-secondary-custom w-100">
                                <i class="bi bi-search"></i> Buscar Ingresos
                            </button>
                        </div>
                    </form>
                </div>
            </div>


            <c:if test="${not empty listaIngresos}">
                <div class="card-custom mt-3">
                    <div class="card-header">
                        <i class="bi bi-list"></i> Ingresos Encontrados
                        <span class="count-badge ms-2">${listaIngresos.size()} registros</span>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-container" style="border: none; border-radius: 0;">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre Socio</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ingreso" items="${listaIngresos}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td><strong>${ingreso.nombreSocio}</strong></td>
                                            <td>${ingreso.fecha_ingreso}</td>
                                            <td>
                                                <span class="badge-time">${ingreso.hora_ingreso}</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>

        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(item => {
                if (item.getAttribute('href') === 'SocioControlador?accion=ingresar') {
                    item.classList.add('active');
                }
            });
        </script>

    </body>
</html>