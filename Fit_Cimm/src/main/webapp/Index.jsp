<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FitCIMM - Sistema de Gestión</title>

        <jsp:include page="header.jsp" />

        <style>

            .main-content {
                padding: 35px 50px;
            }

            .alert-custom {
                padding: 12px 20px;
                font-size: 14px;
                border-radius: 8px;
            }

            .alert-container {
                max-width: 950px;
                margin: 0 auto 16px auto;
            }


            .card-form {
                border: 1px solid #e9ecef;
                border-radius: 14px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.05);
                background: #ffffff;
                max-width: 950px;
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
            }

            .form-control-lg-custom:focus {
                border-color: #4a6fa5;
                box-shadow: 0 0 0 4px rgba(74, 111, 165, 0.12);
                background: #ffffff;
            }

            .form-control-lg-custom::placeholder {
                color: #a0aec0;
                font-size: 14px;
            }

            .form-label {
                font-size: 14px;
                font-weight: 600;
                color: #2d3748;
                margin-bottom: 5px;
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


            .text-muted.form-hint {
                display: none !important;
            }


            .welcome-title {
                font-size: 28px;
                color: #1a2a3a;
                font-weight: 700;
                margin: 0;
            }

            .welcome-title i {
                color: #4a6fa5;
                margin-right: 12px;
            }

            .welcome-subtitle {
                font-size: 15px;
                color: #8a9bb5;
                margin-top: 4px;
            }

            .page-header-custom {
                padding: 0 0 22px 0;
                margin-bottom: 28px;
                border-bottom: 2px solid #e9ecef;
                max-width: 950px;
                margin-left: auto;
                margin-right: auto;
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
                .card-form {
                    max-width: 100%;
                }
                .welcome-title {
                    font-size: 22px;
                }
                .welcome-subtitle {
                    font-size: 13px;
                }
                .page-header-custom {
                    max-width: 100%;
                }
                .alert-container {
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <!-- Encabezado GRANDE -->
            <div class="page-header-custom">
                <h1 class="welcome-title"><i class="bi bi-grid"></i> Panel de Control</h1>
                <div class="welcome-subtitle">Bienvenido al sistema de gestión del gimnasio FitCIMM</div>
            </div>


            <c:if test="${not empty error}">
                <div class="alert-container">
                    <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty mensajeExito}">
                <div class="alert-container">
                    <div class="alert alert-success alert-dismissible fade show alert-custom" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i>
                        ${mensajeExito}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </div>
            </c:if>

            >
            <div id="registrar" class="card card-form">
                <div class="card-header">
                    <i class="bi bi-person-plus"></i> Registrar Nuevo Socio
                </div>
                <div class="card-body">
                    <form action="SocioControlador" method="POST">
                        <!-- Fila 1: Nombres y Apellidos -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nombres *</label>
                                <input type="text" name="nombre" class="form-control form-control-lg-custom" 
                                       placeholder="Ingrese los nombres completos" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Apellidos *</label>
                                <input type="text" name="apellido" class="form-control form-control-lg-custom" 
                                       placeholder="Ingrese los apellidos completos" required>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Documento *</label>
                                <input type="number" name="documento" class="form-control form-control-lg-custom" 
                                       placeholder="Número de documento" required min="100000">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Teléfono</label>
                                <input type="number" name="telefono" class="form-control form-control-lg-custom" 
                                       placeholder="Número de teléfono">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Correo Electrónico</label>
                                <input type="email" name="correo" class="form-control form-control-lg-custom" 
                                       placeholder="correo@ejemplo.com">
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Fecha de Nacimiento *</label>
                                <input type="date" name="fecha_nacimiento" class="form-control form-control-lg-custom" 
                                       required max="2011-07-28" title="Debe ser mayor de 15 años">
                                <small class="text-muted form-hint">Debe ser mayor de 15 años</small>
                            </div>
                            <div class="col-md-6 mb-3 d-flex align-items-end justify-content-end">
                                <button type="submit" class="btn btn-registrar" name="Registrar" value="Registrar">
                                    <i class="bi bi-check-circle"></i> Registrar Socio
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>


        <script>
            document.querySelector('input[name="fecha_nacimiento"]').addEventListener('change', function () {
                const fechaNac = new Date(this.value);
                const hoy = new Date();
                let edad = hoy.getFullYear() - fechaNac.getFullYear();
                const mes = hoy.getMonth() - fechaNac.getMonth();
                if (mes < 0 || (mes === 0 && hoy.getDate() < fechaNac.getDate())) {
                    edad--;
                }

                if (edad < 15) {
                    this.setCustomValidity('Debe ser mayor de 15 años');
                    this.style.borderColor = '#dc2626';
                } else {
                    this.setCustomValidity('');
                    this.style.borderColor = '';
                }
            });
        </script>

    </body>
</html>