import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    // /movies group
    let movies = app.grouped("movies")
    
    movies.get { req async in
        [Movie(title: "Superman", year: 2008),
        Movie(title: "Batman", year: 2002),
        Movie(title: "I Am Legend", year: 2018)]
    }
    
    // Route parameters or Dynamic parameters
    // /movies/action
    // /movies/horror
    // /movies/comedy
    // /movies/romance
    movies.get(":genre") { req async throws -> String in
        
        guard let genre = req.parameters.get("genre") else {
            throw Abort(.badRequest)
        }
        
        return "All movies from \(genre) genre"
    }
    
    // /movies/action/2024
    movies.get(":genre", ":year") { req async throws -> String in
        
        guard let genre = req.parameters.get("genre"),
              let year = req.parameters.get("year")
        else {
            throw Abort(.badRequest)
        }
        
        return "All movies of \(genre) genre from \(year)"
    }
    
    // /movies group
    
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        return movie
    }
    
    app.get("moviesQuery") { req async throws in
        
        let moviesQuery = try req.query.decode(MoviesQuery.self)
        return moviesQuery
    }
    
    //user group
    
    let users = app.grouped("users")
    
    users.get { req async -> String in
            return "Users"
    }
    
    //returning customerId as an Int
    users.get(":customerId") { req async throws -> String in
        
        guard let customerId = req.parameters.get("customerId", as: Int.self)
        else {
            throw Abort(.badRequest)
        }
        
        return "\(customerId)"
    }
}
