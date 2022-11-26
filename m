Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7DE639433
	for <lists+linux-tegra@lfdr.de>; Sat, 26 Nov 2022 08:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiKZHfR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 26 Nov 2022 02:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiKZHfQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Nov 2022 02:35:16 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F142BB23
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 23:35:14 -0800 (PST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NK3Qk217nz15Mlk;
        Sat, 26 Nov 2022 15:34:38 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 15:35:12 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 26 Nov
 2022 15:35:09 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <mperttunen@nvidia.com>,
        <cyndis@kapsi.fi>
CC:     <yangyingliang@huawei.com>
Subject: [PATCH v2 resend 0/2] gpu: host1x: possible double free and memory leak
Date:   Sat, 26 Nov 2022 15:33:13 +0800
Message-ID: <20221126073315.365567-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patchset fix two possible problems in the error path in
host1x_memory_context_list_init().

v1 -> v2:
  patch #1 don't return error code, if IOMMU is disabled.
  patch #2 make error handling code more clean.

  Put the two patches in one patchset.
  http://patchwork.ozlabs.org/project/linux-tegra/patch/20221028130300.1133520-1-yangyingliang@huawei.com/
  http://patchwork.ozlabs.org/project/linux-tegra/patch/20221124080559.3592650-1-yangyingliang@huawei.com/

Yang Yingliang (2):
  gpu: host1x: fix potential double free if IOMMU is disabled
  gpu: host1x: fix memory leak of device names

 drivers/gpu/host1x/context.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.25.1

