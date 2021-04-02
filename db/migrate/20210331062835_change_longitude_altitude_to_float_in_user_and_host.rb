class ChangeLongitudeAltitudeToFloatInUserAndHost < ActiveRecord::Migration[6.1]
  def up
    execute 'ALTER TABLE users ALTER COLUMN latitude TYPE numeric USING (latitude::numeric)'
    execute 'ALTER TABLE users ALTER COLUMN longitude TYPE numeric USING (longitude::numeric)'

    execute 'ALTER TABLE hosts ALTER COLUMN latitude TYPE numeric USING (latitude::numeric)'
    execute 'ALTER TABLE hosts ALTER COLUMN longitude TYPE numeric USING (longitude::numeric)'
  end
  
  def down
    execute 'ALTER TABLE users ALTER COLUMN latitude TYPE text USING (latitude::text)'
    execute 'ALTER TABLE users ALTER COLUMN longitude TYPE text USING (longitude::text)'

    execute 'ALTER TABLE hosts ALTER COLUMN latitude TYPE text USING (latitude::text)'
    execute 'ALTER TABLE hosts ALTER COLUMN longitude TYPE text USING (longitude::text)'
  end
end
