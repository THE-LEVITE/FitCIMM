<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Membresías por Vencer - FitCIMM</title>

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
                color: #d69e2e;
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
                background: #fffbeb;
                border-bottom: 1px solid #f0e6c8;
                padding: 14px 20px;
                font-weight: 600;
                font-size: 14px;
                color: #8a6d2b;
                border-radius: 10px 10px 0 0;
            }

            .card-custom .card-header i {
                color: #d69e2e;
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

            .badge-count {
                background: #fffbeb;
                color: #8a6d2b;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
            }

            .badge-estado {
                padding: 4px 12px;
                border-radius: 12px;
                font-size: 11px;
                font-weight: 600;
                background: #fffbeb;
                color: #8a6d2b;
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
            .empty-state h5 {
                color: #4a5568;
                margin-bottom: 4px;
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

            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            .result-info {
                background: #fffbeb;
                padding: 8px 16px;
                border-radius: 6px;
                font-size: 13px;
                color: #8a6d2b;
                margin-bottom: 16px;
                border-left: 3px solid #d69e2e;
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
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <div class="page-header-custom">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                    <div>
                        <h1 class="page-title"><i class="bi bi-exclamation-triangle"></i> Membresías por Vencer</h1>
                        <div class="page-subtitle">Socios cuya membresía vence en los próximos 5 días</div>
                    </div>
                    <a href="MembresiaControlador?accion=listar" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Volver a la lista
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

            <c:if test="${not empty listaPorVencer}">
                <div class="result-info">
                    <i class="bi bi-info-circle me-2"></i>
                    <strong>${listaPorVencer.size()}</strong> membresía(s) están por vencer en los próximos 5 días
                </div>
            </c:if>

            <div class="card-custom">
                <div class="card-header">
                    <i class="bi bi-list"></i> Socios con Membresía por Vencer
                    <span class="badge-count">${listaPorVencer.size()} registros</span>
                </div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${not empty listaPorVencer}">
                            <div class="table-container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Socio</th>
                                            <th>Plan</th>
                                            <th>Fecha Inicio</th>
                                            <th>Fecha Fin</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="membresia" items="${listaPorVencer}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td><strong>${membresia.nombreSocio}</strong></td>
                                                <td>${membresia.nombrePlan}</td>
                                                <td>${membresia.fecha_inicio}</td>
                                                <td>${membresia.fecha_fin}</td>
                                                <td>
                                                    <span class="badge-estado">
                                                        <i class="bi bi-clock"></i> ${membresia.estado}
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="bi bi-check-circle"></i>
                                <h5>No hay membresías por vencer</h5>
                                <p class="text-muted" style="font-size: 13px;">Todas las membresías están vigentes por más de 5 días.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>

        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(function (item) {
                if (item.getAttribute('href') === 'MembresiaControlador?accion=porVencer') {
                    item.classList.add('active');
                }
            });
        </script>

    </body>
</html>