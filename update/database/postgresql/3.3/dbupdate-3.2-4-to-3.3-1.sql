UPDATE ezsite_data SET value='3.3-1' WHERE name='ezpublish-version';
UPDATE ezsite_data SET value='1' WHERE name='ezpublish-release';

ALTER TABLE ezinfocollection ADD COLUMN user_identifier VARCHAR(34);
ALTER TABLE ezinfocollection ADD COLUMN modified INT;
ALTER TABLE ezinfocollection ALTER modified SET DEFAULT 0;
ALTER TABLE ezinfocollection_attribute ADD COLUMN contentobject_attribute_id INT;
ALTER TABLE ezinfocollection_attribute ADD COLUMN contentobject_id INT;


CREATE SEQUENCE ezpdf_export_s
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;

CREATE TABLE ezpdf_export ( 
  id integer DEFAULT nextval('ezpdf_export_s'::text) NOT NULL,
  title varchar(255) default NULL,
  show_frontpage int default NULL,
  intro_text text default NULL,
  sub_text text default NULL,
  source_node_id int default NULL,
  export_structure varchar(255) default NULL,
  export_classes varchar(255) default NULL,
  site_access varchar(255) default NULL,
  pdf_filename varchar(255) default NULL,
  modifier_id integer default NULL,
  modified integer default NULL,
  created integer default NULL,
  creator_id integer default NULL,
  status integer default NULL,
  PRIMARY KEY (id) 
);

CREATE SEQUENCE ezrss_export_s
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;

CREATE TABLE ezrss_export (
  id integer DEFAULT nextval('ezrss_export_s'::text) NOT NULL,
  title varchar(255) default NULL,
  modifier_id integer default NULL,
  modified integer default NULL,
  url varchar(255) default NULL,
  description text,
  image_id integer default NULL,
  active integer default NULL,
  access_url varchar(255) default NULL,
  created integer default NULL,
  creator_id integer default NULL,
  status integer default NULL,
  rss_version varchar(255) default NULL,
  site_access varchar(255) default NULL,
  PRIMARY KEY  (id)
);

CREATE SEQUENCE ezrss_export_item_s
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;

CREATE TABLE ezrss_export_item (
  id integer DEFAULT nextval('ezrss_export_item_s'::text) NOT NULL,
  rssexport_id integer default NULL,
  source_node_id integer default NULL,
  class_id integer default NULL,
  title varchar(255) default NULL,
  description varchar(255) default 0,
  PRIMARY KEY  (id)
);

CREATE INDEX ezrss_export_rsseid ON ezrss_export_item( rssexport_id );

CREATE SEQUENCE ezrss_import_s
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;

CREATE TABLE ezrss_import (
  id integer DEFAULT nextval('ezrss_import_s'::text) NOT NULL,
  name varchar(255) default NULL,
  url text,
  destination_node_id integer default NULL,
  class_id integer default NULL,
  class_title varchar(255) default NULL,
  class_url varchar(255) default NULL,
  class_description varchar(255) default NULL,
  active integer default NULL,
  creator_id integer default NULL,
  created integer default NULL,
  modifier_id integer default NULL,
  modified integer default NULL,
  status integer default NULL,
  object_owner_id integer default NULL,
  PRIMARY KEY  (id)
);




CREATE SEQUENCE ezimagefile_s
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;

CREATE TABLE ezimagefile (
  id INTEGER DEFAULT nextval('ezimagefile_s'::text) NOT NULL,
  contentobject_attribute_id INTEGER NOT NULL,
  filepath TEXT NOT NULL,
  PRIMARY KEY ( id )
);

CREATE INDEX ezimagefile_coid ON ezimagefile( contentobject_attribute_id );
CREATE INDEX ezimagefile_file ON ezimagefile( filepath );

CREATE TABLE eztipafriend_counter (
  node_id integer NOT NULL default '0',
  count integer NOT NULL default '0',
  PRIMARY KEY  (node_id)
);

CREATE TABLE ezview_counter (
  node_id integer NOT NULL default '0',
  count integer NOT NULL default '0',
  PRIMARY KEY  (node_id)
);

ALTER TABLE ezcontentobject_attribute ADD COLUMN data_type_string VARCHAR(50);

UPDATE ezcontentobject_attribute
SET data_type_string=ezcontentclass_attribute.data_type_string 
WHERE ezcontentobject_attribute.contentclassattribute_id=ezcontentclass_attribute.id;

ALTER TABLE ezcontentobject_version ADD COLUMN workflow_event_pos INT;
ALTER TABLE ezcontentobject_version ALTER workflow_event_pos SET DEFAULT 0;

UPDATE ezsite_data SET value='2' WHERE name='ezpublish-release';

ALTER TABLE ezsubtree_notification_rule ADD user_id INTEGER;
ALTER TABLE ezsubtree_notification_rule ALTER user_id SET NOT NULL;

CREATE SEQUENCE tmp_notification_rule_s
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;

CREATE TABLE tmp_notification_rule ( id INTEGER DEFAULT nextval('tmp_notification_rule_s'::text) NOT NULL,
                                     use_digest INTEGER DEFAULT 0,
                                     node_id INTEGER NOT NULL,
                                     user_id INTEGER NOT NULL,
                                     primary key( id ) );

INSERT INTO tmp_notification_rule ( use_digest, node_id, user_id ) SELECT rule.use_digest, rule.node_id, ezuser.contentobject_id AS user_id 
      FROM ezsubtree_notification_rule AS rule, ezuser 
      WHERE rule.address=ezuser.email;

DROP TABLE ezsubtree_notification_rule;
ALTER TABLE tmp_notification_rule rename TO ezsubtree_notification_rule;

CREATE INDEX ezsubtree_notification_rule_id ON ezsubtree_notification_rule(id);
CREATE INDEX ezsubtree_notification_rule_user_id ON ezsubtree_notification_rule(user_id);

