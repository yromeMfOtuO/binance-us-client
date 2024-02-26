# TIPS：setup.py 修改版本

function clean() {
    rm -rf ./dist/
    rm -rf ./build/
    rm -rf ./binance-us-client.egg-info/
    echo 'clean Successfully'
}

function build() {
    echo 'build start ...'
    # 构建
    python3 setup.py sdist bdist_wheel
    echo 'build Successfully'
}

function upload() {
    echo 'upload start'
    # 发布，增加两步验证后需要使用 token
    python3 -m twine upload dist/* -u '__token__' -p '<your token value>'
    echo 'upload Successfully'
}

# 清理构建目录
echo 'clean before build ...'
clean
build
upload
# 重新清理构建目录
echo 'clean after upload ...'
clean
