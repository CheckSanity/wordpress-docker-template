# WordPress docker template

## Before you start
- Install Docker and Docker Compose

## Setup
1. **WordPress Container**:
     - `site/wp-content`: Place your `wp-content` folder here. It includes themes, plugins, uploads, etc.

2. **Database Container**:
     - `mysqldumps/backup.sql`: Put your production database snapshot here. It's imported automatically on first run.
     - `init/migrate.sh`: Database migration script, runs automatically
     - `database` volume will be located under `./database`

3. **Environment**

   Create `.env` file in project root folder or copy `.env.example`

     - `db_root_password` (required): Default root password. Set any, e.g. `root`
     - `db_host` (required): Database host. `db:3306`
     - `db_name` (required): WordPress database name. e.g. `my_database`
     - `db_user` (required): WordPress database user. e.g. `wordpress`
     - `db_password` (required): WordPress database password. e.g. `password`
     - `db_table_prefix` (optional): WordPress tables prefix (if appliable). e.g. `dFlCnAD_`
     - `wp_plugins_to_disable` (optional): Folder names of plugin to be disabled. e.g `duplicator,elementor`
     - `wp_debug_mode` (optional): Turns on WordPress DEBUG mode if set
     - `production_url` (required): URL of your production site. e.g. `https://yourproductionsite.com/`. This will search provided link in database and replace `options.home` and `options.siteurl` with `http://localhost/` 

4. **Running**
```bash
docker-compose up -d && docker exec -ti wordpress '/prep.sh'
```

Access your site at `http://localhost` and the admin panel at `http://localhost/wp-admin`.
Access Adminer to manage database at `http://localhost:8080`

## Using with Elementor

If using with Elementor, do not forget to go to `Elementor -> Tools -> Replace URL` and replace your `https://yourproductionsite.com/` with `http://localhost/`

## Notes

This version is created for specific project. Please update WordPress image version and MySQL version on your needs.
Right now using:
- `WordPress 6.5.5 with PHP 8.1`
- `MySQL 8.0.36`

## Credits

Based on `https://github.com/lugosidomotor/DockerLocalWordPress`
