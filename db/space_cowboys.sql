DROP TABLE IF EXISTS space_cowboys;

CREATE TABLE space_cowboys (
  id serial4 primary key,
  name VARCHAR(255),
  home_world VARCHAR(255),
  last_known_location VARCHAR(255),
  favourite_weapon VARCHAR(255)

);