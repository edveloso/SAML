<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.onelogin.saml.*,com.onelogin.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auth Request</title>
<%

  // the appSettings object contain application specific settings used by the SAML library
  AppSettings appSettings = new AppSettings();

  // set the URL of the consume.jsp (or similar) file for this app. The SAML Response will be posted to this URL
  appSettings.setAssertionConsumerServiceUrl("http://localhost:8080/consume.jsp");

  // set the issuer of the authentication request. This would usually be the URL of the issuing web application
  appSettings.setIssuer("https://www.mywebapp.com");
  
  // the accSettings object contains settings specific to the users account. 
  // At this point, your application must have identified the users origin
  AccountSettings accSettings = new AccountSettings();

  // The URL at the Identity Provider where to the authentication request should be sent
  accSettings.setIdpSsoTargetUrl("https://www.facebook.com/");
  
  // Generate an AuthRequest and send it to the identity provider
  AuthRequest authReq = new AuthRequest(appSettings, accSettings);
  String reqString = accSettings.getIdp_sso_target_url()+"?SAMLRequest=" + URLEncoder.encode(authReq.getRequest(AuthRequest.base64),"UTF-8");
  response.sendRedirect(reqString);
%>
</head>
<body>
</body>
</html>