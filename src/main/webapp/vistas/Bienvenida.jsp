<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>







<!DOCTYPE html>



<html lang="es">







<head>







<meta charset="utf-8">







<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover">







<title>VitaLete</title>







<!-- TIPOGRAFÍAS -->



<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Sora:wght@600;700;800&family=Figtree:wght@400;500;600;700&display=swap">







<!-- ESTILOS CSS -->



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/estilos/Bienvenidas.css">







</head>







<body>







	<!-- =================================================



         ENCABEZADO



         ================================================= -->







	<header>







		<div class="wrap">







			<div class="brand">







				<img src="<%=request.getContextPath()%>/img/VITALETE.LOGO.png"
					alt="Logo de VitaLete"> VITALETE







			</div>







		</div>







	</header>











	<!-- =================================================



         CONTENIDO PRINCIPAL



         ================================================= -->







	<main>







		<div class="wrap">







			<div class="top">







				<!-- TÍTULO -->







				<h1>







					Bienvenidos a <span class="gt">VitaLete</span>







				</h1>











				<!-- DESCRIPCIÓN -->







				<div class="desc">







					<h2>¿Qué es VitaLete?</h2>







					<p>Es un pulsera pensada para la gente de la tercera edad, ya
						que las pulseras actualmente son un poco complejas de usar al
						tener pantalla tactil que dificulta su uso para los adultos
						mayores. Nuestra pulsera al tener 3 botones con funciones vitales
						es mucho mas practica y así facilitando su uso</p>







				</div>







			</div>







		</div>











		<!-- =================================================



             ELECTROCARDIOGRAMA VITALETE



             MODIFICACIÓN COMPLETA:







             TRES PATRONES DIFERENTES DE LATIDOS.



             LAS PROPIAS LÍNEAS SE DIBUJAN.



             ================================================= -->







		<div class="pulse" aria-hidden="true">







			<svg viewBox="0 0 1200 140" preserveAspectRatio="none">







                <!-- DEGRADADO AZUL Y VERDE -->







                <defs>







                    <linearGradient id="pg1" x1="0" x2="1" y1="0" y2="0">







                        <stop offset="0%" stop-color="#2e77a1" />







                        <stop offset="50%" stop-color="#59c183" />







                        <stop offset="100%" stop-color="#2e77a1" />







                    </linearGradient>







                </defs>











                <!-- ======================================



                     PATRÓN 1: PICOS GRANDES Y PEQUEÑOS



                     ====================================== -->







                <path class="ecg-line ecg-a" pathLength="1000"
					d="



                    M0 84



                    H65



                    L78 74 L91 84



                    H135



                    L150 48 L164 112 L178 84



                    H220



                    L235 65 L250 92 L265 84



                    H310



                    L325 20 L341 125 L357 84



                    H410



                    L425 72 L440 84



                    H475



                    L490 55 L505 98 L520 84



                    H565



                    L580 8 L598 130 L615 84



                    H670



                    L685 45 L700 105 L715 84



                    H760



                    L775 68 L790 84



                    H835



                    L850 30 L866 118 L882 84



                    H930



                    L945 60 L960 95 L975 84



                    H1200



                    " />











                <!-- ======================================



                     PATRÓN 2: LATIDOS IRREGULARES



                     ====================================== -->







                <path class="ecg-line ecg-b" pathLength="1000"
					d="



                    M0 84



                    H100



                    L115 60 L130 84



                    H180



                    L195 35 L210 105 L225 84



                    H260



                    L275 70 L290 84



                    H335



                    L350 12 L367 128 L385 84



                    H430



                    L445 55 L460 100 L475 84



                    H510



                    L525 76 L540 84



                    H590



                    L605 40 L620 95 L635 84



                    H680



                    L695 5 L710 130 L728 84



                    H780



                    L795 65 L810 84



                    H850



                    L865 25 L880 115 L895 84



                    H940



                    L955 50 L970 100 L985 84



                    H1030



                    L1045 68 L1060 84



                    H1100



                    L1115 40 L1130 105 L1145 84



                    H1200



                    " />











                <!-- ======================================



                     PATRÓN 3: MÁS ONDAS Y VARIACIONES



                     ====================================== -->







                <path class="ecg-line ecg-c" pathLength="1000"
					d="



                    M0 84



                    H45



                    L60 72 L75 84



                    H110



                    L125 45 L140 110 L155 84



                    H185



                    L200 60 L215 95 L230 84



                    H260



                    L275 25 L290 120 L305 84



                    H340



                    L355 70 L370 84



                    H400



                    L415 48 L430 105 L445 84



                    H480



                    L495 10 L510 130 L525 84



                    H560



                    L575 65 L590 90 L605 84



                    H640



                    L655 35 L670 112 L685 84



                    H720



                    L735 75 L750 84



                    H785



                    L800 15 L817 125 L835 84



                    H870



                    L885 55 L900 100 L915 84



                    H950



                    L965 42 L980 110 L995 84



                    H1030



                    L1045 68 L1060 84



                    H1090



                    L1105 30 L1120 115 L1135 84



                    H1200



                    " />







            </svg>







		</div>







		<!-- FIN DE LA MODIFICACIÓN DEL ELECTROCARDIOGRAMA -->











		<!-- =================================================



             BOTÓN EXPLORAR



             ================================================= -->







		<div class="go">







			<a class="btn" href="<%=request.getContextPath()%>/vistas/Inicio.jsp">







				Explorar más → </a>







		</div>







	</main>











	<!-- PIE DE PÁGINA -->



	<footer>















		<p>VitaLete · Independiente en cada paso, acompañado en cada
			pulso.</p>







		<span>Instituto Técnico Nuestra Señora de Fátima (A-893) ·
			Villa Soldati, Ciudad de Buenos Aires, Argentina</span>







	</footer>







</body>



</html>