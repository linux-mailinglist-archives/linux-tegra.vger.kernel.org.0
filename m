Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1085B3AC0E5
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Jun 2021 04:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFRCpm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Jun 2021 22:45:42 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:11058 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhFRCpm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 22:45:42 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5jpC4kcxzZf7L;
        Fri, 18 Jun 2021 10:40:35 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 10:43:32 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 18 Jun
 2021 10:43:31 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>
CC:     <lgirdwood@gmail.com>, <broonie@kernel.org>
Subject: [PATCH -next 0/4] ASoC: tegra: Use devm_platform_get_and_ioremap_resource()
Date:   Fri, 18 Jun 2021 10:47:18 +0800
Message-ID: <20210618024722.2618842-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use devm_platform_get_and_ioremap_resource() to simplify
code.

Yang Yingliang (4):
  ASoC: tegra20: i2s: Use devm_platform_get_and_ioremap_resource()
  ASoC: tegra20: spdif: Use devm_platform_get_and_ioremap_resource()
  ASoC: tegra: tegra210_admaif: Use
    devm_platform_get_and_ioremap_resource()
  ASoC: tegra30: ahub: Use devm_platform_get_and_ioremap_resource()

 sound/soc/tegra/tegra20_i2s.c     | 3 +--
 sound/soc/tegra/tegra20_spdif.c   | 3 +--
 sound/soc/tegra/tegra210_admaif.c | 4 +---
 sound/soc/tegra/tegra30_ahub.c    | 3 +--
 4 files changed, 4 insertions(+), 9 deletions(-)

-- 
2.25.1

