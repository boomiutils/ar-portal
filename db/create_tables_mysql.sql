-- --------------------------------------------------------
-- SQL Commands to set up the boomi_ar_portal.
--
-- This file is meant for use with MySQL 5 and above!
-- --------------------------------------------------------

--
-- Database : `arportal`
--
CREATE DATABASE IF NOT EXISTS heroku_99a5fcce93ea52e;
USE heroku_99a5fcce93ea52e;

--
-- Table structure for table `arp_address`
--
CREATE TABLE IF NOT EXISTS arp_account (
  id CHAR(36) NOT NULL,
  description VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Account Table';

--
-- Table structure for table `arp_address`
--
CREATE TABLE IF NOT EXISTS arp_address (
  id CHAR(36) NOT NULL,
  description VARCHAR(255) NOT NULL DEFAULT '',
  street VARCHAR(255) NOT NULL DEFAULT '',
  street_two VARCHAR(255) NOT NULL DEFAULT '',
  city VARCHAR(255) NOT NULL DEFAULT '',
  state VARCHAR(255) NOT NULL DEFAULT '',
  zip VARCHAR(255) NOT NULL DEFAULT '',
  shipping TINYINT(1) DEFAULT 0,
  PRIMARY KEY  (`id`)
)
  COMMENT='Address Table';

--
-- Table structure for table `arp_attribute`
--
CREATE TABLE IF NOT EXISTS arp_attribute (
  id CHAR(36) NOT NULL,
  parent_id CHAR(36) NOT NULL,
  parent_object_type CHAR(36) NOT NULL,
  attribute_key VARCHAR(255) NOT NULL DEFAULT '',
  attribute_value VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
COMMENT='Extended attributes for objects of any type';

--
-- Table structure for table `arp_audit_event`
--
CREATE TABLE IF NOT EXISTS arp_audit_event (
  id CHAR(36) NOT NULL,
  tenant_id CHAR(36) NOT NULL,
  tenant_account_id CHAR(36) NOT NULL,
  event_type VARCHAR(25) NOT NULL,
  description VARCHAR(256) NOT NULL DEFAULT  '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Audit Events for the system';

--
-- Table structure for table `arp_entitlement`
--
CREATE TABLE IF NOT EXISTS arp_entitlement (
  id CHAR(36) NOT NULL,
  role_id CHAR(36) NOT NULL,
  name VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Entitlements';

--
-- Table structure for table `arp_identity`
--
CREATE TABLE IF NOT EXISTS arp_identity (
  id CHAR(36) NOT NULL,
  organization_id CHAR(36) NOT NULL,
  first_name VARCHAR(255) NOT NULL DEFAULT '',
  last_name VARCHAR(255) NOT NULL DEFAULT '',
  email VARCHAR(255) NOT NULL DEFAULT '',
  office_phone VARCHAR(25) NOT NULL DEFAULT '',
  work_phone VARCHAR(25) NOT NULL DEFAULT '',
  cell_phone VARCHAR(25) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Identities';

--
-- Table structure for table `arp_location`
--
CREATE TABLE IF NOT EXISTS arp_location (
  id CHAR(36) NOT NULL,
  organization_id CHAR(36) NOT NULL,
  address_id CHAR(36),
  name VARCHAR(255) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Locations';

--
-- Table structure for table `arp_organization`
--
CREATE TABLE IF NOT EXISTS arp_organization (
  id CHAR(36) NOT NULL,
  tenant_id CHAR(36) NOT NULL,
  address_id CHAR(36),
  name VARCHAR(255) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT '',
  website_url VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Identities';

--
-- Table structure for table `arp_request`
--
CREATE TABLE IF NOT EXISTS arp_request (
  id CHAR(36) NOT NULL,
  tenant_id CHAR(36) NOT NULL,
  organization_id CHAR(36) NOT NULL,
  requestor_account_id CHAR(36) NOT NULL,
  request_state INT (1) DEFAULT 0,
  description VARCHAR(256) NOT NULL DEFAULT  '',
  request_date_time TIMESTAMP,
  completed_date_time TIMESTAMP,
  timeout_duration INT(4) DEFAULT 0,
  PRIMARY KEY  (`id`)
)
  COMMENT='Requests';

--
-- Table structure for table `arp_request_step`
--
CREATE TABLE IF NOT EXISTS arp_request_step (
  id CHAR(36) NOT NULL,
  request_id CHAR(36) NOT NULL,
  approved_by CHAR(36),
  step_state INT(1) DEFAULT 0,
  active_date_time TIMESTAMP,
  completed_date_time TIMESTAMP,
  description VARCHAR(256) NOT NULL DEFAULT  '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Request Step';

--
-- Table structure for table `arp_request_approver`
--
CREATE TABLE IF NOT EXISTS arp_request_approver (
  id CHAR(36) NOT NULL,
  request_id CHAR(36) NOT NULL,
  account_id CHAR(36) NOT NULL,
  PRIMARY KEY  (`id`)
)
  COMMENT='Request Approvers';

--
-- Table structure for table `arp_tenant`
--
CREATE TABLE IF NOT EXISTS arp_tenant (
  id CHAR(36) NOT NULL,
  parent_id CHAR(36),
  name VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Tenants';

--
-- Table structure for table `arp_tenant_account`
--
CREATE TABLE IF NOT EXISTS arp_tenant_account (
  id CHAR(36) NOT NULL,
  tenant_id CHAR(36) NOT NULL,
  first_name VARCHAR(255) NOT NULL DEFAULT '',
  last_name VARCHAR(255) NOT NULL DEFAULT '',
  email VARCHAR(255) NOT NULL DEFAULT '',
  account_id VARCHAR(255) NOT NULL,
  account_password VARCHAR(256) NOT NULL,
  last_password_rest INT(3) DEFAULT 0,
  PRIMARY KEY  (`id`)
)
  COMMENT='Tenant Accounts';

--
-- Table structure for table `arp_tenant_role_entitlement`
--
CREATE TABLE IF NOT EXISTS arp_tenant_entitlement (
  id CHAR(36) NOT NULL,
  tenant_role_id CHAR(36) NOT NULL,
  name VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Tenant Application Role Entitlements';

--
-- Table structure for table `arp_tenant_question_answer`
--
CREATE TABLE IF NOT EXISTS arp_tenant_question_answer (
  id CHAR(36) NOT NULL,
  tenant_account_id CHAR(36) NOT NULL,
  question VARCHAR(255) NOT NULL DEFAULT '',
  answer VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Tenant Accounts';

--
-- Table structure for table `arp_tenant_role`
--
CREATE TABLE IF NOT EXISTS arp_tenant_role (
  id CHAR(36) NOT NULL,
  tenant_id CHAR(36) NOT NULL,
  role_name VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
)
  COMMENT='Tenant Application Roles';






