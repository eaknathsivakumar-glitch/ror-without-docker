# Rails API Application

A Ruby on Rails 7.2 API application configured for deployment across multiple environments (staging, QA, production, and preview) with integrated storage services.

## Prerequisites

- **Ruby**: 3.4.7
- **Rails**: 7.2.3+
- **Bundler**: Latest version

## System Dependencies

- Ruby 3.4.7
- Bundler
- Git

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd ror-without-docker
```

2. Install dependencies:
```bash
bundle install
```

3. Set up environment variables:
```bash
cp .env.example .env
```

4. Create and initialize the database:
```bash
rails db:create
rails db:migrate
```

## Configuration

The application uses environment-specific configurations defined in `revolte.yml` for deployment across multiple environments:

- **Staging**: Main branch deployment with web service and storage bucket
- **QA**: Develop branch deployment with enhanced configurations
- **Production**: Main branch with auto-scaling capabilities (1-3 replicas)
- **Preview**: Preview environment with dedicated resources

### Environment Variables

Configure the following in your `.env` file:
- `BASE_URL`: API base URL (default: `/api/v1`)
- `ACCESS_KEY_ID`: Storage bucket access key
- `SECRET_ACCESS_KEY_ID`: Storage bucket secret key
- `REGION`: AWS region for storage services

## Running the Application

### Development

Start the Rails development server:
```bash
rails server
```

The application will be available at `http://localhost:3000`

### Production

Start the Puma web server:
```bash
bundle exec puma -c config/puma.rb
```

## Database

### Create Database
```bash
rails db:create
```

### Run Migrations
```bash
rails db:migrate
```

### Reset Database
```bash
rails db:reset
```

## Testing

Run the test suite:
```bash
npm run test
```

## Code Quality

The project includes code quality tools:

- **Rubocop**: Ruby linting with Rails omakase configuration
- **Brakeman**: Security vulnerability scanner

Run linting:
```bash
rubocop
```

Run security checks:
```bash
brakeman
```

## Project Structure

```
├── app/
│   ├── controllers/     # API controllers
│   └── models/          # Data models
├── config/              # Configuration files
├── db/                  # Database migrations and seeds
├── lib/                 # Custom libraries
├── public/              # Static files
├── Gemfile              # Ruby dependencies
├── revolte.yml          # Deployment configuration
└── config.ru            # Rack configuration
```

## Services

### Web Service
- **Port**: 8080
- **Health Check**: `/health`
- **Load Balancer Mode**: Dedicated
- **CPU**: 2 cores
- **Memory**: 1 GB
- **Storage**: 30 GB

### Storage Bucket Service
- **Versioning**: Enabled
- **Public Access**: Disabled
- **Bucket Names**:
  - Staging: `eaksample`
  - QA: `eaksample-qssh`
  - Production: `eaksample-s`
  - Preview: `eaksample-h`

## Deployment

The application is configured for deployment via the Revolte platform with automated code review and test suite execution for all environments.

### Deployment Environments

- **Staging**: Automatic deployment on main branch push
- **QA**: Automatic deployment on develop branch push
- **Production**: Automatic deployment on main branch with auto-scaling
- **Preview**: Preview deployments with code review enabled

## Troubleshooting

### Bundle Install Issues
If you encounter bundle install issues, try:
```bash
bundle update
```

### Database Issues
Reset the database:
```bash
rails db:reset
```

## Contributing

1. Create a feature branch from `develop`
2. Make your changes
3. Ensure code passes linting and security checks
4. Submit a pull request

## License

[Add your license information here]

## Support

For issues and questions, please contact the development team.
