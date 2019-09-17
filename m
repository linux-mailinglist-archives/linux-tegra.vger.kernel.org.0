Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46392B54FC
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 20:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfIQSMh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 14:12:37 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:46142 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbfIQSMh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 14:12:37 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAHxq-0003oC-Mf; Tue, 17 Sep 2019 19:12:34 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iAHxq-0000BD-6H; Tue, 17 Sep 2019 19:12:34 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk
Subject: RFC: TDM mode support on the tegra30
Date:   Tue, 17 Sep 2019 19:12:25 +0100
Message-Id: <20190917181233.534-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an initial set that adds support for both the TDM and for
formats other than 8/16bit audio through the audio system. It also
fixes a minor issue with the FIFO stopping order.

I have further patches following on which deal with selection of
clocks to allow the use of the tegra's audio unit to run as clock
slave (all current examples have the tegra as clock master).


