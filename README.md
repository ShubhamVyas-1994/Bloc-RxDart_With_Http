# Bloc-RxDart_With_Http
  This project is a simple example of bloc state management using rxdart <PublishSubject>.
  Simple employee list which can be refreshed to get data and have an scroll pagination. data required for list is fetched from server. 
  Incoming data is then converted into stream which is then passed to stream builder.
  
  Folder Structure :-
    1. Models => Here we are parsing JSON object and structuring it.
    2. UI => A simple Employee list with refresh and scroll pagination.
    3. Resource => Api provider for fetching employee list.
    4. Bloc => Logic for fetching, refreshing and loading more data.
