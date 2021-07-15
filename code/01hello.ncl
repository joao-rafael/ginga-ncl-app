<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Exemplo de sincronismo sem a interacao do usuario com reuso de regioes e descritores -->
<ncl id="syncEx" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="screenReg" width="100%" height="100%" zIndex="2">
				<region id="frameReg" left="0%" top="85%" width="100%" height="15%" zIndex="3"/>
				<region id="bpmReg" left="85%" top="10%" width="15%" height="9%" zIndex="3"/>]
				<region id="dashboardReg" left="65%" top="0%" width="35%" height="45%" zIndex="3"/>
		</region>
		</regionBase>
		<descriptorBase>
			<descriptor id="screenDesc" region="screenReg"/>
			<descriptor id="notifyDesc" region="frameReg" explicitDur="15s"/>
			<descriptor id="bpmDesc" region="bpmReg" explicitDur="15s"/>
			<descriptor id="dashboardDesc" region="dashboardReg" explicitDur="30s"/>
		</descriptorBase>
		<connectorBase>
			<importBase documentURI="causalConnBase.ncl" alias="conEx"/>
		</connectorBase>
	</head>

	<body>
		<port id="entry" component="mainVideo"/>
		<media id="mainVideo" src="../media/video.mp4" descriptor="screenDesc">
			<area id="segNotify" begin="5s"/>
			<area id="segBpm" begin="5s"/>
			<area id="segDashboard" begin="21s"/>
		</media>
		<media id="dashboard" src="../media/dashboard.jpeg" descriptor="dashboardDesc"/>
		<media id="notify" src="../media/notify.jpeg" descriptor="notifyDesc"/>
		<media id="bpm" src="../media/bpm.jpeg" descriptor="bpmDesc"/>
		<link  id="lNotify" xconnector="conEx#onBeginStart">
			<bind role="onBegin" component="mainVideo" interface="segNotify"/>
			<bind role="start" component="notify"/>			
		</link>	
		<link  id="lBpm" xconnector="conEx#onBeginStart">
			<bind role="onBegin" component="mainVideo" interface="segBpm"/>
			<bind role="start" component="bpm"/>			
		</link>
		<link  id="lDashboard" xconnector="conEx#onBeginStart">
			<bind role="onBegin" component="mainVideo" interface="segDashboard"/>
			<bind role="start" component="dashboard"/>			
		</link>
	
	</body>
</ncl>