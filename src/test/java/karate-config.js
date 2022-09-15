function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
	  baseUrl: 'http://localhost:3000'
  }

  if (env == 'dev') {
    config.someUrlBase = 'http://localhost:3000';
    config.userName = 'admin@brain.com'
    config.userPassword = 'Admin!123'
  }
  else if (env == 'qa') {
    config.someUrlBase = 'https://e2e-host/v1/auth';
    config.userName = ''
    config.userPassword = ''
  }

  // generate a token through
  var accessToken = karate.callSingle('classpath:helpers/token-reusable.feature', config).authToken
  karate.configure('headers', {Authorization: 'Bearer ' + accessToken})


  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}














