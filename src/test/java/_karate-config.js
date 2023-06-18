	function fn() {
	var env = karate.env; // get java system property 'karate.env'
	karate.log('karate.env system property was:', env);	
	karate.configure("ssl", true);
	if (!env) {
	env = 'beta';
	baseURL:'https://api-beta.lightmetrics.co'
	karate.properties['clientId'] 
	karate.properties['baseUrl']
	}
	karate.log('karate.env system property was:', env);
	var config = {
	env: env,
	//AUTH_URL: 'https://api-beta.lightmetrics.co/v1/authorize/oauth2/token'
	//baseURL:"https://api-beta.lightmetrics.co/v1/"
	//USER_NAME = 'robert.fiftyscheduler@mailinator.com'
	//PASSWORD = 'Moni1971!'
	//config.ADMINPASSWORD ='Alcon@123!'
	//config.PASSWORD = 'Test@123'
	};
	if (env == 'beta') {
	config.baseURL = 'https://api-beta.lightmetrics.co/v1/'

	} 
	if (env == 'qa') {
	config.baseURL = 'https://api-qa.lightmetrics.co/v1/'

	} 
	if (env == 'apiv-qa') {
	config.baseURL = 'https://apiv-beta.lightmetrics.co/v1/'

	} 
	else if (env == 'apiv-beta') {
	config.baseURL = 'https://apiv-beta.lightmetrics.co/v1/'

	}
	karate.log('Auth Url:', config.AUTH_URL);
	//karate.log('Simple Patient password:', config.PASSWORD);
	karate.configure('connectTimeout', 60000);
	karate.configure('readTimeout', 60000);
	karate.log('karate.env =', karate.env);
	karate.log('config.baseUrl =', config.baseURL);
	return config;
	}