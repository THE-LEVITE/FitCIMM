<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Socio - FitCIMM</title>


        <jsp:include page="header.jsp" />

        <style>

            .main-content {
                padding: 30px 40px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .page-header-custom {
                padding: 0 0 18px 0;
                margin-bottom: 22px;
                border-bottom: 2px solid #e9ecef;
                width: 100%;
                max-width: 950px;
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


            .card-form {
                border: 1px solid #e9ecef;
                border-radius: 14px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.05);
                background: #ffffff;
                max-width: 950px;
                width: 100%;
                margin: 0 auto;
            }

            .card-form .card-header {
                background: #f8fafc;
                border-bottom: 1px solid #e9ecef;
                padding: 18px 32px;
                font-weight: 700;
                font-size: 18px;
                color: #1a2a3a;
                border-radius: 14px 14px 0 0;
            }

            .card-form .card-header i {
                color: #4a6fa5;
                margin-right: 10px;
                font-size: 20px;
            }

            .card-form .card-body {
                padding: 36px 40px;
            }


            .form-control-lg-custom {
                padding: 12px 18px;
                font-size: 15px;
                height: 48px;
                border-radius: 8px;
                border: 1.5px solid #e2e8f0;
                transition: all 0.2s ease;
                background: #fafbfc;
                width: 100%;
            }

            .form-control-lg-custom:focus {
                border-color: #4a6fa5;
                box-shadow: 0 0 0 4px rgba(74, 111, 165, 0.12);
                background: #ffffff;
                outline: none;
            }

            .form-control-lg-custom::placeholder {
                color: #a0aec0;
                font-size: 14px;
            }

            .form-control-lg-custom[readonly] {
                background-color: #f1f3f5;
                cursor: not-allowed;
                color: #6c757d;
            }

            .form-label {
                font-size: 14px;
                font-weight: 600;
                color: #2d3748;
                margin-bottom: 5px;
            }

            .form-hint {
                font-size: 12px;
                color: #8a9bb5;
                margin-top: 4px;
                display: block;
            }

            .form-hint i {
                font-size: 12px;
            }

            .mb-3 {
                margin-bottom: 18px !important;
            }


            .btn-registrar {
                padding: 12px 40px;
                font-size: 16px;
                border-radius: 8px;
                font-weight: 600;
                height: 48px;
                display: inline-flex;
                align-items: center;
                gap: 10px;
                background: #0f7b3e;
                border-color: #0f7b3e;
                color: #fff;
                transition: all 0.25s ease;
                box-shadow: 0 2px 6px rgba(15, 123, 62, 0.15);
                border: none;
                cursor: pointer;
            }

            .btn-registrar:hover {
                background: #0a6933;
                border-color: #0a6933;
                color: #fff;
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(15, 123, 62, 0.30);
            }

            .btn-registrar i {
                font-size: 18px;
                margin: 0;
            }


            .btn-cancelar {
                padding: 12px 40px;
                font-size: 16px;
                border-radius: 8px;
                font-weight: 600;
                height: 48px;
                display: inline-flex;
                align-items: center;
                gap: 10px;
                background: #6c757d;
                border-color: #6c757d;
                color: #fff;
                transition: all 0.25s ease;
                border: none;
                cursor: pointer;
                text-decoration: none;
            }

            .btn-cancelar:hover {
                background: #5a6268;
                border-color: #5a6268;
                color: #fff;
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(108, 117, 125, 0.30);
                text-decoration: none;
                color: #fff;
            }

            .btn-cancelar i {
                font-size: 18px;
                margin: 0;
            }


            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
                width: 100%;
                max-width: 950px;
            }

            .alert-custom i {
                font-size: 16px;
            }


            @media (max-width: 768px) {
                .main-content {
                    padding: 16px;
                }
                .card-form .card-body {
                    padding: 20px;
                }
                .card-form .card-header {
                    padding: 14px 20px;
                    font-size: 16px;
                }
                .form-control-lg-custom {
                    height: 42px;
                    font-size: 14px;
                    padding: 10px 14px;
                }
                .btn-registrar {
                    height: 42px;
                    padding: 10px 24px;
                    font-size: 14px;
                }
                .btn-cancelar {
                    height: 42px;
                    padding: 10px 24px;
                    font-size: 14px;
                }
                .card-form {
                    max-width: 100%;
                }
                .page-title {
                    font-size: 20px;
                }
                .page-header-custom {
                    max-width: 100%;
                }
                .alert-custom {
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <!-- Encabezado -->
            <div class="page-header-custom">
                <h1 class="page-title"><i class="bi bi-pencil-square"></i> Editar Socio</h1>
                <div class="page-subtitle">Modificar la información del socio seleccionado</div>
            </div>


            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>


            <div class="card card-form">
                <div class="card-header">
                    <i class="bi bi-person"></i> Datos del Socio
                </div>
                <div class="card-body">
                    <form action="SocioControlador" method="POST">
                        <input type="hidden" name="idEdit" value="${idEdit}" />


                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nombres *</label>
                                <input type="text" name="nombreEdit" class="form-control form-control-lg-custom" 
                                       value="${nombreEdit}" placeholder="Ingrese los nombres completos" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Apellidos *</label>
                                <input type="text" name="apellidoEdit" class="form-control form-control-lg-custom" 
                                       value="${apellidoEdit}" placeholder="Ingrese los apellidos completos" required>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Documento *</label>
                                <input type="number" name="documentoEdit" class="form-control form-control-lg-custom" 
                                       value="${documentoEdit}" readonly>
                                <small class="form-hint">
                                    <i class="bi bi-info-circle"></i> El documento no se puede modificar
                                </small>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Teléfono</label>
                                <input type="number" name="telefonoEdit" class="form-control form-control-lg-custom" 
                                       value="${telefonoEdit}" placeholder="Número de teléfono">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Correo Electrónico</label>
                                <input type="email" name="correoEdit" class="form-control form-control-lg-custom" 
                                       value="${correoEdit}" placeholder="correo@ejemplo.com">
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Fecha de Nacimiento *</label>
                                <input type="date" name="fecha_nacimientoEdit" class="form-control form-control-lg-custom" 
                                       value="${fecha_nacimientoEdit}" required>
                            </div>
                            <div class="col-md-6 mb-3 d-flex align-items-end justify-content-end gap-3">
                                <button type="submit" class="btn-registrar" name="guardar" value="guardar">
                                    <i class="bi bi-check-circle"></i> Guardar Cambios
                                </button>
                                <a href="SocioControlador?accion=listar" class="btn-cancelar">
                                    <i class="bi bi-x-circle"></i> Cancelar
                                </a>
                            </div>
                        </div>

                    </form>
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