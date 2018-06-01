module AssetHelper
  # Get Asset as HTML String
  def asset path
    raw Rails.application.assets_manifest.assets[path].to_s
  end
end
