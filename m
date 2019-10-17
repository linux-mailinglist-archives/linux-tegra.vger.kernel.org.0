Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8E4DAAC4
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Oct 2019 13:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730498AbfJQLEd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Oct 2019 07:04:33 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:52588 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfJQLEd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Oct 2019 07:04:33 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL3a1-0002ch-AQ; Thu, 17 Oct 2019 12:04:29 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iL3a0-0008AW-Ld; Thu, 17 Oct 2019 12:04:28 +0100
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: make 'host1x_cdma_wait_pushbuffer_space' static
Date:   Thu, 17 Oct 2019 12:04:27 +0100
Message-Id: <20191017110427.31354-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The host1x_cdma_wait_pushbuffer_space function is not declared
or directly called from outside the file it is in, so make it
static.

Fixes the following sparse warnign:
drivers/gpu/host1x/cdma.c:235:5: warning: symbol 'host1x_cdma_wait_pushbuffer_space' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/host1x/cdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 48c84c48299c..e8d3fda91d8a 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -232,9 +232,9 @@ unsigned int host1x_cdma_wait_locked(struct host1x_cdma *cdma,
  *
  * Must be called with the cdma lock held.
  */
-int host1x_cdma_wait_pushbuffer_space(struct host1x *host1x,
-				      struct host1x_cdma *cdma,
-				      unsigned int needed)
+static int host1x_cdma_wait_pushbuffer_space(struct host1x *host1x,
+					     struct host1x_cdma *cdma,
+					     unsigned int needed)
 {
 	while (true) {
 		struct push_buffer *pb = &cdma->push_buffer;
-- 
2.23.0

