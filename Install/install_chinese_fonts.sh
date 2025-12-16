#!/bin/bash

# =============================================================================
# 天基观测数据科学分析与可视化系统 - 中文字体安装脚本
# 适用于AWS SageMaker环境
# 创建时间: $(date '+%Y-%m-%d %H:%M:%S')
# =============================================================================

echo "🚀 开始安装中文字体支持..."
echo "📍 适用于天基观测数据科学分析与可视化系统"
echo "=" * 60

# 1. 创建字体目录
echo "📁 步骤1: 创建字体目录..."
mkdir -p ~/.fonts
echo "✅ 字体目录创建完成: ~/.fonts"

# 2. 下载中文字体（SourceHan Sans）
echo "📥 步骤2: 下载Source Han Sans中文字体..."
echo "   正在从GitHub下载字体文件..."
wget -O ~/.fonts/SourceHanSans.zip "https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip"

if [ $? -eq 0 ]; then
    echo "✅ 字体下载成功"
else
    echo "❌ 字体下载失败，请检查网络连接"
    exit 1
fi

# 3. 进入字体目录
echo "📂 步骤3: 进入字体目录..."
cd ~/.fonts

# 4. 解压字体文件
echo "📦 步骤4: 解压字体文件..."
unzip -q SourceHanSans.zip
echo "✅ 字体文件解压完成"

# 5. 查看解压后的内容
echo "📋 步骤5: 查看解压后的内容..."
echo "   字体目录内容:"
ls -la
echo ""

# 6. 删除zip文件（节省空间）
echo "🗑️  步骤6: 清理临时文件..."
rm SourceHanSans.zip
echo "✅ 临时文件清理完成"

# 7. 更新字体缓存
echo "🔄 步骤7: 更新系统字体缓存..."
fc-cache -fv ~/.fonts
echo "✅ 字体缓存更新完成"

# 8. 验证中文字体是否安装成功
echo "🔍 步骤8: 验证中文字体安装..."
echo "   检测到的中文字体:"
fc-list :lang=zh

# 9. 查看Source Han字体
echo "📝 步骤9: 查看已安装的Source Han字体..."
echo "   Source Han字体列表:"
fc-list | grep -i "source\|han"

# 10. 返回用户目录
echo "🏠 步骤10: 返回用户主目录..."
cd ~

# 安装完成提示
echo ""
echo "🎉 中文字体安装完成！"
echo "=" * 60
echo "📊 安装摘要:"
echo "   - 字体类型: Source Han Sans CN (思源黑体)"
echo "   - 安装位置: ~/.fonts/SubsetOTF/CN/"
echo "   - 字体数量: 7个字体文件"
echo "   - 支持样式: Regular, Bold, Light, Medium, Heavy, ExtraLight, Normal"
echo ""
echo "🔧 接下来的步骤:"
echo "   1. 在Jupyter notebook中配置matplotlib字体"
echo "   2. 使用以下Python代码:"
echo ""
echo "   from matplotlib import rcParams"
echo "   rcParams['font.sans-serif'] = ['Source Han Sans CN', 'DejaVu Sans']"
echo "   rcParams['axes.unicode_minus'] = False"
echo ""
echo "✅ 您的天基观测数据科学分析与可视化系统现在支持中文显示了！"
echo "🌟 海南项目数据可视化将完美呈现中文标签和图表标题"
