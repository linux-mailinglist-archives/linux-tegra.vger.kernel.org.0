Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4956C10045E
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 12:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfKRLjB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 06:39:01 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7134 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726461AbfKRLjB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 06:39:01 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id EB4392065B50C814627D;
        Mon, 18 Nov 2019 19:38:59 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 19:38:49 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <treding@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Mon, 18 Nov 2019 19:46:10 +0800
Message-ID: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

zhengbin (2):
  drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
    tegra_bo_dumb_create
  drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in tegra_gem_create

 drivers/gpu/drm/tegra/drm.c | 5 +----
 drivers/gpu/drm/tegra/gem.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

--
2.7.4

