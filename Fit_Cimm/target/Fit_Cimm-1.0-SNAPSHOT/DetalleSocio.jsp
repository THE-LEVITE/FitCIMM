<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle del Socio - FitCIMM</title>


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

            /* Tarjetas */
            .card-custom {
                border: 1px solid #e9ecef;
                border-radius: 10px;
                box-shadow: 0 1px 4px rgba(0,0,0,0.04);
                background: #ffffff;
                margin-bottom: 20px;
            }

            .card-custom .card-header {
                padding: 14px 20px;
                font-weight: 600;
                font-size: 14px;
                color: #ffffff;
                border-radius: 10px 10px 0 0;
            }

            .card-custom .card-header i {
                margin-right: 8px;
            }

            .card-custom .card-header.bg-primary-custom {
                background: #1a56db;
            }

            .card-custom .card-header.bg-secondary-custom {
                background: #4a5568;
            }

            .card-custom .card-body {
                padding: 20px 24px;
            }

            /* Información del socio */
            .info-label {
                font-weight: 600;
                color: #4a5568;
                font-size: 13px;
                display: block;
                margin-bottom: 2px;
            }

            .info-value {
                font-size: 15px;
                color: #1a2a3a;
                display: block;
                padding: 6px 12px;
                background: #f8fafc;
                border-radius: 6px;
                margin-bottom: 8px;
            }

            .info-value .badge {
                font-size: 12px;
                padding: 4px 14px;
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

            .badge-status.bg-danger {
                background: #dc2626 !important;
                color: #ffffff !important;
            }

            .badge-status.bg-warning {
                background: #d69e2e !important;
                color: #ffffff !important;
            }

            .badge-status.bg-secondary {
                background: #6c757d !important;
                color: #ffffff !important;
            }


            .table-container {
                background: #ffffff;
                border-radius: 10px;
                overflow: hidden;
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

            .days-remaining {
                font-size: 12px;
                color: #6c757d;
                display: block;
                margin-top: 4px;
            }


            @media (max-width: 768px) {
                .main-content {
                    padding: 16px;
                }
                .card-custom .card-body {
                    padding: 16px;
                }
                .page-title {
                    font-size: 20px;
                }
                .info-value {
                    font-size: 14px;
                    padding: 4px 10px;
                }
                .table-container .table {
                    font-size: 12px;
                }
                .table-container .table thead th,
                .table-container .table tbody td {
                    padding: 8px 10px;
                }
                .badge-status {
                    font-size: 10px;
                    padding: 3px 10px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <!-- Encabezado -->
            <div class="page-header-custom">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                    <div>
                        <h1 class="page-title"><i class="bi bi-person-badge"></i> Detalle del Socio</h1>
                        <div class="page-subtitle">Información completa del socio y su historial de membresías</div>
                    </div>
                    <a href="SocioControlador?accion=listar" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Volver a la lista
                    </a>
                </div>
            </div>


            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="padding: 10px 16px; font-size: 13px; border-radius: 8px;">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            >
            <div class="card-custom">
                <div class="card-header bg-primary-custom">
                    <i class="bi bi-person"></i> Información Personal
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <span class="info-label"><i class="bi bi-person"></i> Nombres</span>
                            <span class="info-value">${socio.nombres}</span>

                            <span class="info-label"><i class="bi bi-person"></i> Apellidos</span>
                            <span class="info-value">${socio.apellidos}</span>

                            <span class="info-label"><i class="bi bi-card-text"></i> Documento</span>
                            <span class="info-value">${socio.documento}</span>
                        </div>
                        <div class="col-md-6">
                            <span class="info-label"><i class="bi bi-telephone"></i> Teléfono</span>
                            <span class="info-value">
                                <c:choose>
                                    <c:when test="${not empty socio.telefono}">${socio.telefono}</c:when>
                                    <c:otherwise><span class="text-muted">No registrado</span></c:otherwise>
                                </c:choose>
                            </span>

                            <span class="info-label"><i class="bi bi-envelope"></i> Correo Electrónico</span>
                            <span class="info-value">
                                <c:choose>
                                    <c:when test="${not empty socio.correo}">${socio.correo}</c:when>
                                    <c:otherwise><span class="text-muted">No registrado</span></c:otherwise>
                                </c:choose>
                            </span>

                            <span class="info-label"><i class="bi bi-calendar3"></i> Fecha de Nacimiento</span>
                            <span class="info-value">${socio.fecha_nacimiento}</span>

                            <span class="info-label"><i class="bi bi-circle"></i> Estado</span>
                            <span class="info-value">
                                <span class="badge-status ${socio.activo ? 'bg-success' : 'bg-danger'}">
                                    ${socio.activo ? 'ACTIVO' : 'INACTIVO'}
                                </span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card-custom">
                <div class="card-header bg-secondary-custom">
                    <i class="bi bi-clock-history"></i> Historial de Membresías
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty historial}">
                            <div class="text-center py-4 text-muted">
                                <i class="bi bi-ticket" style="font-size: 32px; display: block; margin-bottom: 10px;"></i>
                                <p>Este socio no tiene membresías registradas.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Plan</th>
                                            <th>Fecha Inicio</th>
                                            <th>Fecha Fin</th>
                                            <th>Valor Pagado</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="membresia" items="${historial}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>
                                                    <span class="badge" style="background: #e9ecef; color: #1a2a3a; padding: 4px 12px; font-weight: 500;">
                                                        ${membresia.nombrePlan}
                                                    </span>
                                                </td>
                                                <td>${membresia.fecha_inicio}</td>
                                                <td>${membresia.fecha_fin}</td>
                                                <td><strong>$${membresia.valor_pagado}</strong></td>
                                                <td>
                                                    <span class="badge-status 
                                                          ${membresia.estado == 'VIGENTE' ? 'bg-success' : 
                                                            membresia.estado == 'POR_VENCER' ? 'bg-warning' : 'bg-danger'}">
                                                              ${membresia.estado}
                                                          </span>
                                                          <c:if test="${membresia.diasRestantes > 0}">
                                                              <span class="days-remaining">
                                                                  <i class="bi bi-clock"></i> ${membresia.diasRestantes} días restantes
                                                              </span>
                                                          </c:if>
                                                          <c:if test="${membresia.diasRestantes == 0 && membresia.estado != 'VENCIDA'}">
                                                              <span class="days-remaining" style="color: #d69e2e;">
                                                                  <i class="bi bi-exclamation-triangle"></i> Vence hoy
                                                              </span>
                                                          </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="mt-3 text-muted" style="font-size: 13px;">
                                    <i class="bi bi-ticket"></i> 
                                    <strong>${historial.size()}</strong> membresía(s) registrada(s)
                                    <span class="count-badge ms-2">
                                        <c:set var="vigentes" value="0" />
                                        <c:forEach var="m" items="${historial}">
                                            <c:if test="${m.estado == 'VIGENTE' || m.estado == 'POR_VENCER'}">
                                                <c:set var="vigentes" value="${vigentes + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        <i class="bi bi-check-circle-fill" style="font-size: 10px;"></i>
                                        ${vigentes} activas
                                    </span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>


            <script>
                document.querySelectorAll('.sidebar .nav-item').forEach(item => {
                    if (item.getAttribute('href') === 'SocioControlador?accion=listar') {
                        item.classList.add('active');
                    }
                });
            </script>

        </body>
    </html>