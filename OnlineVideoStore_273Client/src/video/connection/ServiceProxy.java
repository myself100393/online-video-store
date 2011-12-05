package video.connection;

public class ServiceProxy implements video.connection.Service {
  private String _endpoint = null;
  private video.connection.Service service = null;
  
  public ServiceProxy() {
    _initServiceProxy();
  }
  
  public ServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initServiceProxy();
  }
  
  private void _initServiceProxy() {
    try {
      service = (new video.connection.ServiceServiceLocator()).getService();
      if (service != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)service)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (service != null)
      ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public video.connection.Service getService() {
    if (service == null)
      _initServiceProxy();
    return service;
  }
  
  public video.dto.Address getAddress(int userId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getAddress(userId);
  }
  
  public java.lang.String logout(int userId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.logout(userId);
  }
  
  public boolean isUsernameExisted(java.lang.String username) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.isUsernameExisted(username);
  }
  
  public video.dto.PersonInfo displayPerson(int personId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.displayPerson(personId);
  }
  
  public java.lang.String updatePersonAccount(video.dto.Person person, video.dto.Account account, video.dto.Address address) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updatePersonAccount(person, account, address);
  }
  
  public video.dto.Account getAccount(int userId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getAccount(userId);
  }
  
  public video.dto.Person getPerson(java.lang.String username) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getPerson(username);
  }
  
  public java.lang.String deletePerson(int personId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.deletePerson(personId);
  }
  
  public video.dto.Person[] find_Persons(int id, java.lang.String firstName, java.lang.String lastName, java.lang.String username, java.util.Calendar registration, java.util.Calendar last_Login) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.find_Persons(id, firstName, lastName, username, registration, last_Login);
  }
  
  public video.dto.MovieInfo displayMovie(int movieId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.displayMovie(movieId);
  }
  
  public java.lang.String logon(java.lang.String username, java.lang.String pwd) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.logon(username, pwd);
  }
  
  public video.dto.Movie[] listMovies() throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.listMovies();
  }
  
  public java.lang.String issueMovie(int movieId, int personId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.issueMovie(movieId, personId);
  }
  
  public java.lang.String addMovie(video.dto.Movie movie) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.addMovie(movie);
  }
  
  public java.lang.String submitMovie(int movieId, int personId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.submitMovie(movieId, personId);
  }
  
  public java.lang.String updateMovie(video.dto.Movie movie) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updateMovie(movie);
  }
  
  public java.lang.String deleteMovie(java.lang.String movieId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.deleteMovie(movieId);
  }
  
  public java.lang.String signUp(video.dto.Person person, int accountType) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.signUp(person, accountType);
  }
  
  public video.dto.Movie[] findMovies(int id, java.lang.String name, java.lang.String banner, java.util.Calendar release, double rentalPrice, int category, boolean isAvailable) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.findMovies(id, name, banner, release, rentalPrice, category, isAvailable);
  }
  
  public video.dto.Bill generateBill(int personId, int month, int year) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.generateBill(personId, month, year);
  }
  
  
}