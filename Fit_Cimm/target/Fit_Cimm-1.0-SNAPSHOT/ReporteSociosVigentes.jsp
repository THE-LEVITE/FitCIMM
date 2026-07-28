<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Socios con Membresía Vigente - FitCIMM</title>

        
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

            .badge-status {
                padding: 5px 14px;
                border-radius: 14px;
                font-size: 12px;
                font-weight: 700;
                display: inline-block;
                letter-spacing: 0.3px;
                text-transform: uppercase;
            }

            .badge-status.bg-success {
                background: #0f7b3e !important;
                color: #ffffff !important;
            }

            .badge-status.bg-warning {
                background: #d69e2e !important;
                color: #ffffff !important;
            }

            .badge-plan {
                display: inline-block;
                font-size: 11px;
                font-weight: 500;
                color: #1a2a3a;
                background: #e9ecef;
                padding: 3px 14px;
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
                .badge-status {
                    font-size: 10px;
                    padding: 3px 10px;
                }
                .badge-plan {
                    font-size: 10px;
                    padding: 2px 10px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <div class="page-header-custom">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                    <div>
                        <h1 class="page-title"><i class="bi bi-people text-success"></i> Socios con Membresía Vigente</h1>
                        <div class="page-subtitle">Lista de socios activos con membresía vigente o por vencer</div>
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
                    <i class="bi bi-list"></i> Lista de Socios
                    <span class="badge-count">${socios.size()} registros</span>
                </div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${not empty socios}">
                            <div class="table-container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Documento</th>
                                            <th>Plan</th>
                                            <th>Estado</th>
                                            <th>Días Restantes</th>
                                            <th>Fecha Vencimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="socio" items="${socios}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>
                                                    <strong>${socio.nombres}</strong><br>
                                                    <small class="text-muted">${socio.apellidos}</small>
                                                </td>
                                                <td>${socio.documento}</td>
                                                <td>
                                                    <span class="badge-plan">${socio.membresiaActual.nombrePlan}</span>
                                                </td>
                                                <td>
                                                    <span class="badge-status 
                                                          ${socio.membresiaActual.estado == 'VIGENTE' ? 'bg-success' : 'bg-warning'}">
                                                        ${socio.membresiaActual.estado}
                                                    </span>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${socio.membresiaActual.diasRestantes > 0}">
                                                            <strong>${socio.membresiaActual.diasRestantes}</strong>
                                                            <small class="text-muted d-block" style="font-size: 10px;">días</small>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-warning" style="font-weight: 600;">Hoy</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${socio.membresiaActual.fecha_fin}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="p-3 border-top" style="background: #f8fafc; border-radius: 0 0 10px 10px;">
                                <div class="d-flex flex-wrap gap-3 text-muted" style="font-size: 13px;">
                                    <span>
                                        <i class="bi bi-people"></i> 
                                        <strong>${socios.size()}</strong> socios con membresía vigente
                                    </span>
                                    <span>
                                        <i class="bi bi-check-circle-fill text-success"></i>
                                        <c:set var="vigentes" value="0" />
                                        <c:forEach var="s" items="${socios}">
                                            <c:if test="${s.membresiaActual.estado == 'VIGENTE'}">
                                                <c:set var="vigentes" value="${vigentes + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        <strong>${vigentes}</strong> VIGENTES
                                    </span>
                                    <span>
                                        <i class="bi bi-exclamation-triangle-fill text-warning"></i>
                                        <c:set var="porVencer" value="0" />
                                        <c:forEach var="s" items="${socios}">
                                            <c:if test="${s.membresiaActual.estado == 'POR_VENCER'}">
                                                <c:set var="porVencer" value="${porVencer + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        <strong>${porVencer}</strong> POR VENCER
                                    </span>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="bi bi-people"></i>
                                <h5>No hay socios con membresía vigente</h5>
                                <p class="text-muted" style="font-size: 13px;">No se encontraron socios con membresías activas en este momento.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>

        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(item => {
                if (item.getAttribute('href') === 'ReporteControlador?accion=sociosVigentes') {
                    item.classList.add('active');
                }
            });
        </script>

    </body>
</html>