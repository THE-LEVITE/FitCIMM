<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Membresías - FitCIMM</title>

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

            .badge-count {
                background: #ebf4ff;
                color: #1a56db;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
            }

            
            .badge-estado {
                padding: 5px 14px;
                border-radius: 14px;
                font-size: 12px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.3px;
                color: #ffffff;
                display: inline-block;
            }

            .badge-estado.vigente {
                background: #0f7b3e;
            }

            .badge-estado.por-vencer {
                background: #d69e2e;
            }

            .badge-estado.vencida {
                background: #dc2626;
            }

            .badge-estado.sin-estado {
                background: #6c757d;
            }

            .btn-actions {
                display: flex;
                gap: 4px;
                justify-content: center;
            }
            .btn-actions .btn {
                padding: 4px 12px;
                font-size: 12px;
                border-radius: 4px;
                line-height: 1.5;
            }
            .btn-actions .btn i {
                font-size: 13px;
                margin-right: 4px;
            }

            .btn-warning-custom {
                background: #d69e2e;
                border-color: #d69e2e;
                color: #fff;
            }

            .btn-warning-custom:hover {
                background: #b8860b;
                border-color: #b8860b;
                color: #fff;
            }

            .toolbar {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                align-items: center;
                margin-bottom: 20px;
                padding: 14px 20px;
                background: #ffffff;
                border-radius: 10px;
                border: 1px solid #e9ecef;
            }

            .btn-success-toolbar {
                background: #0f7b3e;
                border-color: #0f7b3e;
                color: #fff;
            }

            .btn-success-toolbar:hover {
                background: #0a6933;
                border-color: #0a6933;
                color: #fff;
            }

            .btn-outline-secondary-toolbar {
                color: #6c757d;
                border-color: #dce3ec;
            }

            .btn-outline-secondary-toolbar:hover {
                background: #f1f3f5;
                border-color: #6c757d;
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

            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            @media (max-width: 768px) {
                .main-content {
                    padding: 16px;
                }
                .card-custom .card-body {
                    padding: 16px;
                }
                .toolbar {
                    flex-direction: column;
                    align-items: stretch;
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
                .btn-actions .btn {
                    padding: 3px 8px;
                    font-size: 11px;
                }
                .badge-estado {
                    font-size: 10px;
                    padding: 3px 10px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <div class="page-header-custom">
                <h1 class="page-title"><i class="bi bi-list"></i> Lista de Membresías</h1>
                <div class="page-subtitle">Historial de membresías vendidas</div>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${not empty mensajeExito}">
                <div class="alert alert-success alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    ${mensajeExito}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="toolbar">
                <div style="flex: 1;">
                    <span class="text-muted" style="font-size: 13px;">
                        <i class="bi bi-info-circle"></i> Total: <strong>${listaMembresias.size()}</strong> membresías
                    </span>
                </div>
                <a href="MembresiaControlador?accion=nuevo" class="btn btn-toolbar btn-success-toolbar">
                    <i class="bi bi-plus-circle"></i> Vender Membresía
                </a>
                <a href="MembresiaControlador?accion=porVencer" class="btn btn-toolbar btn-outline-secondary-toolbar">
                    <i class="bi bi-exclamation-triangle"></i> Por Vencer
                </a>
            </div>

            <div class="card-custom">
                <div class="card-header">
                    <i class="bi bi-list"></i> Membresías Registradas
                    <span class="badge-count">${listaMembresias.size()} registros</span>
                </div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${not empty listaMembresias}">
                            <div class="table-container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="width: 40px;">#</th>
                                            <th>Socio</th>
                                            <th>Plan</th>
                                            <th>Fecha Inicio</th>
                                            <th>Fecha Fin</th>
                                            <th style="text-align: right;">Valor</th>
                                            <th style="text-align: center;">Estado</th>
                                            <th style="text-align: center;">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="membresia" items="${listaMembresias}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td><strong>${membresia.nombreSocio}</strong></td>
                                                <td>${membresia.nombrePlan}</td>
                                                <td>${membresia.fecha_inicio}</td>
                                                <td>${membresia.fecha_fin}</td>
                                                <td style="text-align: right;"><strong>$${membresia.valor_pagado}</strong></td>
                                                <td style="text-align: center;">
                                                    <span class="badge-estado 
                                                          ${membresia.estado == 'VIGENTE' ? 'vigente' : 
                                                            membresia.estado == 'POR VENCER' ? 'por-vencer' : 
                                                            membresia.estado == 'VENCIDA' ? 'vencida' : 'sin-estado'}">
                                                              ${membresia.estado}
                                                          </span>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <c:if test="${membresia.estado == 'VENCIDA'}">
                                                            <a href="MembresiaControlador?accion=renovar&id=${membresia.id_membresia}"
                                                               class="btn btn-warning-custom btn-sm" 
                                                               onclick="return confirm('¿Renovar esta membresía?');">
                                                                <i class="bi bi-arrow-repeat"></i> Renovar
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${membresia.estado != 'VENCIDA'}">
                                                            <span class="text-muted" style="font-size: 12px;">—</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="empty-state">
                                    <i class="bi bi-ticket"></i>
                                    <h5>No hay membresías registradas</h5>
                                    <p class="text-muted" style="font-size: 13px;">Aún no se ha vendido ninguna membresía.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>

            <script>
                document.querySelectorAll('.sidebar .nav-item').forEach(function (item) {
                    if (item.getAttribute('href') === 'MembresiaControlador?accion=listar') {
                        item.classList.add('active');
                    }
                });
            </script>

        </body>
    </html>