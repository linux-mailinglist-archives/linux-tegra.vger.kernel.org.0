Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D85CE78A
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Oct 2019 17:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfJGPbl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 7 Oct 2019 11:31:41 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:56058 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfJGPbl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Oct 2019 11:31:41 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iHUz4-0003mb-Ns; Mon, 07 Oct 2019 16:31:38 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iHUz4-0001IC-89; Mon, 07 Oct 2019 16:31:38 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk
Subject: tegra30 tdm support
Date:   Mon,  7 Oct 2019 16:31:29 +0100
Message-Id: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

New series for TDM audio support on tegra30

v2:
- moved edge-control and data-offset to the set_fmt callbacks
- fixed dev_dbg in set_tdm callback
- fixed dev_dbg message contents in set_tdm callback
- changed fsync width to be permanently 1 clock

v3:
- cleanup fsync patch
- fix rebase issue with tdm patch

v4:
- fix comment style issues
- change tdm-a to data-offset 1


